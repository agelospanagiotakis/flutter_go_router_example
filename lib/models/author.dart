// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'book.dart';

class Author {
  final int id;
  final String name;
  final books = <Book>[];

  Author({required this.id, required this.name});

  factory Author.fromJson(Map<String, dynamic> json) {
    var data = Author(
      id: (json["id"]),
      name: (json["authorName"]),
    );

    return data;
  }
}
