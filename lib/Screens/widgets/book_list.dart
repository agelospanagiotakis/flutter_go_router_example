// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/book.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book>? onTap;

  const BookList({
    required this.books,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: books.length,
        itemBuilder: (context0, index) => ListTile(
          title: Text(
            books[index].title,
          ),
          subtitle: const Text("test"
              // books[index]!.author.name,
              ),
          // onTap: onTap != null ? () => onTap!(context, books[index]) : null,
          onTap: () {
            int bid = books[index].id;
            context.go("/books/books_details/$bid");
          },
        ),
      );
}
