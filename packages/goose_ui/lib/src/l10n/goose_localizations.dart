import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'base_localization.dart';
part '_zh.dart';
part '_en.dart';

class GooseLocalizations {
  GooseLocalizations(this.locale);

  final Locale locale;

  final Map<String, BaseLocalization> _translates = {
    'zh': _Zh(),
    'en': _En(),
  };

  BaseLocalization get current {
    if (_translates.containsKey(locale.languageCode)) {
      return _translates[locale.languageCode]!;
    } else {
      return _Zh();
    }
  }

  static const GooseLocalizationsDelegate delegate =
      GooseLocalizationsDelegate();

  static List<Locale> get supportedLocales =>
      const [Locale('zh'), Locale('en')];

  /// get [GooseLocalizations] from context,
  /// fallback language is chinese
  static GooseLocalizations of(BuildContext context) {
    var local =
        Localizations.of<GooseLocalizations>(context, GooseLocalizations);
    if (local != null) return local;
    return GooseLocalizations(const Locale('zh'));
  }
}

class GooseLocalizationsDelegate
    extends LocalizationsDelegate<GooseLocalizations> {
  const GooseLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<GooseLocalizations> load(Locale locale) {
    return SynchronousFuture<GooseLocalizations>(GooseLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<GooseLocalizations> old) {
    return old.hashCode != hashCode;
  }
}
