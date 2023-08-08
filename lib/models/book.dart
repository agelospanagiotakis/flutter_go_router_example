// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'author.dart';

class Book {
  final int id;
  final String title;
  final Author? author = null;
  final bool isPopular;
  final bool isNew;

  Book({
    required this.id,
    required this.title,
    required this.isPopular,
    required this.isNew,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    var data = Book(
        id: json["id"],
        title: json["title"],
        isPopular: json["isPopular"],
        isNew: json["isNew"]
        // author: json["author"],
        );

    return data;
  }
}
