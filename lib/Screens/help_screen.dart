import 'package:flutter/material.dart';

/// The details screen for either the A or B screen.
class HelpScreen extends StatefulWidget {
  /// Constructs a [HelpScreen].
  const HelpScreen({
    required this.issueId,
    required this.label,
    Key? key,
  }) : super(key: key);

  /// The label to display in the center of the screen.
  final String label;
  final String issueId;

  @override
  State<StatefulWidget> createState() => HelpScreenState();
}

/// The state for DetailsScreen
class HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Screen -${widget.issueId}  ${widget.label}'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Details for ${widget.issueId} ',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
    );
  }
}
