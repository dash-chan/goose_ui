import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
import 'package:gallery/widgets/code_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class RatingExample extends StatefulWidget {
  const RatingExample({Key? key}) : super(key: key);

  @override
  State<RatingExample> createState() => _RatingExampleState();
}

class _RatingExampleState extends State<RatingExample> {
  // BEGIN ratingBar1#1
  int _rating = 0;
  // END
  @override
  Widget build(BuildContext context) {
    return GScaffold(
      content: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CodeWrapper(
            title: 'default',
            // BEGIN ratingBar1#2
            child: GIntegerRatingBar(
              value: _rating,
              onPressed: (value) {
                setState(() => _rating = value);
              },
            ),
            // END
            codeBlock: CodeSegments.ratingBar1(context),
          ),
        ],
      ),
    );
  }
}
