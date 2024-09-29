// Package imports:
import 'dart:ui';

import 'package:get/get.dart';

// Project imports:
import 'es_espanna.dart';

class TranslationsHelper extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // 'en_US': {...enUS, },
        'es_ES': {
          ...esEs,
        },
      };

  Iterable<Locale> get supportedLocales => [
        // const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ];
}
