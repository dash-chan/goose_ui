import 'package:flutter/material.dart';

class GLoading extends StatelessWidget {
  final Widget child;
  final bool loading;
  const GLoading({
    Key? key,
    required this.child,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          const Positioned.fill(
            child: Material(
              color: Colors.black12,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}
