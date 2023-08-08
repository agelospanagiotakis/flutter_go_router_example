// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../API/library.dart';
import '../main.dart';
import 'widgets/author_list.dart';

class AuthorsScreen extends StatelessWidget {
  final String title = 'Authors';

  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AuthorList(
          authors: getIt<Library>().allAuthors,
          onTap: (author) {
            context.push('/author/${author.id}');
          },
        ),
      );
}
