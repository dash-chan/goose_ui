import 'package:flutter/material.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class PaginationExample extends StatefulWidget {
  const PaginationExample({Key? key}) : super(key: key);

  @override
  State<PaginationExample> createState() => _PaginationExampleState();
}

class _PaginationExampleState extends State<PaginationExample> {
  int _currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        GPagination(
          value: _currentPage,
          total: 200,
          size: 20,
          onChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
        ),
      ],
    );
  }
}
