import 'package:flutter/material.dart';

//Dimensions
const double kpagePadding = 16.0;
const double kseparatedPadding = 8.0;
const double kiconSize = 24.0;

//Requests
const int limitQueries = 15;

//Key Global
final navigatorKey = GlobalKey<NavigatorState>();

//Language
const List<String> supportedLanguages = ['es', 'en'];
const List<String> supportedCountries = ['ES', 'US'];
const Map<String, String> supportedLocales = {'es': 'ES', 'en': 'US'};
const String defaultLanguage = 'es';
const String defaultCountry = 'ES';
const String defaultUserLocale = 'es_ES';

//Theme
const String defaultTheme = 'light';

//Error codes
const int codeUnknown = 111;
