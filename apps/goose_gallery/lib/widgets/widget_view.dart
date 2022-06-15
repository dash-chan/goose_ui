import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class WidgetView extends StatelessWidget {
  const WidgetView({
    super.key,
    required this.title,
    required this.desc,
    required this.children,
  });
  final String title;
  final String desc;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            sliver: _Title(title, desc),
          ),
          SliverWaterfallFlow(
            gridDelegate:
                const SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => children[index],
              childCount: children.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title, this.desc);
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
