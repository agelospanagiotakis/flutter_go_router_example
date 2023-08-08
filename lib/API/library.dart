// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/author.dart';
import '../models/book.dart';

final libraryInstance = Library()
  ..loadAuthorsFromJson()
  ..loadBooksFromJson();

// ..addBook(
//     title: 'Left Hand of Darkness',
//     authorName: 'Ursula K. Le Guin',
//     isPopular: true,
//     isNew: true)
// ..addBook(
//     title: 'Too Like the Lightning',
//     authorName: 'Ada Palmer',
//     isPopular: false,
//     isNew: true)
// ..addBook(
//     title: 'Kindred',
//     authorName: 'Octavia E. Butler',
//     isPopular: true,
//     isNew: false)
// ..addBook(
//     title: 'The Lathe of Heaven',
//     authorName: 'Ursula K. Le Guin',
//     isPopular: false,
//     isNew: false);

Future<List<Author>> _loadAuthorsFromJson() async {
  var bookString = await rootBundle.loadString('assets/authors_data.json');
  final data = await json.decode(bookString);
  var authors = data['authors'];

  List<Author> allAuthors = [];
  try {
    for (var thisAuth in authors) {
      Author a = Author.fromJson(thisAuth);
      allAuthors.add(a);
    }
  } catch (exception) {
    debugPrint("something went wrong reading authors $exception");
  }
  return allAuthors;
}

Future<List<Book>> _loadBooksFromJson() async {
  var bookString = await rootBundle.loadString('assets/books_data.json');
  final data = await json.decode(bookString);
  var books = data['books'];

  List<Book> allBooks = [];
  try {
    for (var thisBook in books) {
      Book book = Book.fromJson(thisBook);
      allBooks.add(book);
    }
  } catch (exception) {
    debugPrint("something went wrong reading books $exception");
  }
  return allBooks;
}

class Library {
  late final List<Book> allBooks = [];
  late final List<Author> allAuthors = [];

  void addBook({
    required String title,
    required String authorName,
    required bool isPopular,
    required bool isNew,
  }) {
    var author = allAuthors.firstWhere(
      (author) => author.name == authorName,
      orElse: () {
        final value = Author(id: allAuthors.length, name: authorName);
        allAuthors.add(value);
        return value;
      },
    );
    var book = Book(
      id: allBooks.length,
      title: title,
      isPopular: isPopular,
      isNew: isNew,
      // author: author
    );

    author.books.add(book);
    allBooks.add(book);
  }

  List<Book> get popularBooks => [
        ...allBooks.where((book) => book.isPopular),
      ];

  List<Book> get newBooks => [
        ...allBooks.where((book) => book.isNew),
      ];

  loadAuthorsFromJson() async {
    var auths = await _loadAuthorsFromJson();
    allAuthors.addAll(auths);
  }

  loadBooksFromJson() async {
    var books = await _loadBooksFromJson();
    allBooks.addAll(books);
  }
}
