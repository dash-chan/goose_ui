import 'package:flutter/material.dart';
import 'package:goose_ui/src/extensions/list_extension.dart';

class DefaultWeekItem extends StatelessWidget {
  const DefaultWeekItem(
      {super.key, required this.fullScreen, required this.weekday});

  final bool fullScreen;
  final int weekday;

  String weekName(BuildContext context) {
    final l10nWeekdays =
        Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)
            ?.narrowWeekdays;
    var weekDays = <String>['一', '二', '三', '四', '五', '六', '日'];
    if (l10nWeekdays != null) {
      weekDays = l10nWeekdays.offset(1);
    }

    return weekDays[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    Widget result = Text(weekName(context));
    if (fullScreen) {
      result = Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: result,
        ),
      );
    } else {
      result = SizedBox(
        width: 36,
        child: Center(child: result),
      );
    }

    return result;
  }
}
