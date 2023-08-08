import 'package:flutter/material.dart';
import 'package:nested_navigation_gorouter_example/API/library.dart';

import '../models/book.dart';

/// The details screen for either the A or B screen.
class BookScreen extends StatefulWidget {
  /// Constructs a [BookScreen].
  ///
  const BookScreen({
    Key? key,
    required this.bookId,
  }) : super(key: key);

  /// The label to display in the center of the screen.
  final String? bookId;

  @override
  State<StatefulWidget> createState() => BookScreenState();
}

/// The state for DetailsScreen
class BookScreenState extends State<BookScreen> {
  late String? bookId;

  @override
  Widget build(BuildContext context) {
    bookId = widget.bookId;
    var ret = libraryInstance.allBooks.where((Book book) {
      return (book.id.toString() == bookId.toString());
    }).toList();

    // var ret = libraryInstance.allBooks
    //     .where((book) => book.id.toString() == this.bookId)
    //     .toList();

    Book book = ret.first;
    debugPrint(book.title);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Details for book id $bookId',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            Text('Title ${book.title}',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
