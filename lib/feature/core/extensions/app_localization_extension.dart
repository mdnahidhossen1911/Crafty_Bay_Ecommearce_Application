import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationExtension on BuildContext{
  AppLocalizations get localization{
    return AppLocalizations.of(this)!;
  }
}