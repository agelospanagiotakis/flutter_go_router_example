// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../API/library.dart';
import '../main.dart';
import 'widgets/book_list.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({
    super.key,
  });

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(_handleTabIndexChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // final newPath = _routeState.route.pathTemplate;
    // debugPrint("mew path: $newPath");
    // if (newPath.startsWith(APP_PAGE.qr.toPath)) {
    //   _tabController.index = 0;
    // } else if (newPath.startsWith(APP_PAGE.books_new.toPath)) {
    //   _tabController.index = 1;
    // } else if (newPath == APP_PAGE.books_all.toPath) {
    //   _tabController.index = 2;
    // }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndexChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
                icon: Icon(color: Colors.black, Icons.settings, size: 15),
                child: Text(
                  'Popular',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )),
            Tab(
                icon: Icon(color: Colors.black, Icons.settings, size: 15),
                child: Text(
                  'New',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )),
            Tab(
                icon: Icon(color: Colors.black, Icons.settings, size: 15),
                child: Text(
                  'all',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )),
            // Tab(text: 'Counter', icon: Icon(Icons.numbers, size: 15))
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            BookList(
              books: getIt<Library>().popularBooks,
            ),
            BookList(
              books: getIt<Library>().newBooks,
            ),
            BookList(
              books: getIt<Library>().allBooks,
            ),
          ],
        ),
      );

  // void _handleBookTapped(BuildContext context, Book book) {
  //   context.pushNamed('/book/${book.id}');
  // }

  void _handleTabIndexChanged() {
    debugPrint("_handleTabIndexChanged ${_tabController.index}");
    // switch (_tabController.index) {
    //   case 0:
    //     context.pushNamed(APP_PAGE.qr.toPath);
    //   case 1:
    //     context.pushNamed(APP_PAGE.allpages.toPath);
    //   case 2:
    //     context.pushNamed(APP_PAGE.books_all.toPath);
    //   case 3:
    //     context.pushNamed(APP_PAGE.authors.toPath);
    //   case 4:
    //     context.pushNamed(APP_PAGE.settings.toPath);
    //   default:
    //     context.pushNamed(APP_PAGE.allpages.toPath);
    //     break;
    // }
  }
}
