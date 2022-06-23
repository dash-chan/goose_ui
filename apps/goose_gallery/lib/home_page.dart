import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:goose_gallery/widget_views/animated_scroll_widget_view.dart';
import 'package:goose_gallery/widget_views/avatar_view.dart';
import 'package:goose_gallery/widget_views/badge_view.dart';
import 'package:goose_gallery/widget_views/calendar_view.dart';
import 'package:goose_gallery/widget_views/card_view.dart';
import 'package:goose_gallery/widget_views/dropdown_view.dart';
import 'package:goose_gallery/widget_views/loading_icon_view.dart';
import 'package:goose_gallery/widget_views/segmented_view.dart';
import 'package:goose_gallery/widget_views/switch_view.dart';
import 'package:goose_gallery/widget_views/tooltip_view.dart';
import 'package:goose_ui/goose_ui.dart';

import 'widget_views/button_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _current = const SizedBox();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goose Gallery'),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 280,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Button'),
                  onTap: () {
                    setState(() {
                      _current = const ButtonView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('Dropdown'),
                  onTap: () {
                    setState(() {
                      _current = const DropdownView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('Tooltip'),
                  onTap: () {
                    setState(() {
                      _current = const TooltipView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('Loading Icons'),
                  onTap: () {
                    setState(() {
                      _current = const LoadingIconView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('Canlendar'),
                  onTap: () {
                    setState(() {
                      _current = const CalendarView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('Avatar'),
                  onTap: () {
                    setState(() {
                      _current = const AvatarView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('Segmented'),
                  onTap: () {
                    setState(() {
                      _current = const SegmentedView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('Switch'),
                  onTap: () {
                    setState(() {
                      _current = const SwitchView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('Badge'),
                  onTap: () {
                    setState(() {
                      _current = const BadgeView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('card'),
                  onTap: () {
                    setState(() {
                      _current = const ACardView();
                    });
                  },
                ),
                ListTile(
                  title: const Text('Animated Scroll Widgets'),
                  onTap: () {
                    setState(() {
                      _current = const AnimatedScrollWidgetView();
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: PageTransitionSwitcher(
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                return SharedAxisTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.vertical,
                  child: child,
                );
              },
              child: _current,
            ),
          ),
        ],
      ),
    );
  }
}
