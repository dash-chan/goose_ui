import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class WidgetView extends StatefulWidget {
  const WidgetView({
    super.key,
    required this.title,
    required this.desc,
    this.fullWidth = false,
    required this.children,
  });
  final String title;
  final String desc;
  final bool fullWidth;
  final List<Widget> children;

  @override
  State<WidgetView> createState() => _WidgetViewState();
}

class _WidgetViewState extends State<WidgetView> {
  final controller = ScrollController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        controller: controller,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            sliver: _Title(widget.title, widget.desc),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: widget.fullWidth
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                    (context, index) => widget.children[index],
                    childCount: widget.children.length,
                  ))
                : SliverWaterfallFlow(
                    gridDelegate:
                        const SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 500,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => widget.children[index],
                      childCount: widget.children.length,
                    ),
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
