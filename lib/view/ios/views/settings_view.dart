import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/settings_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<SettingsViewModel>(
      builder: (context, model, child) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context).settings),
          ),
          child: Center(child: Text(this.toStringShort() + " -- IOS")),
        );
      },
    );
  }
}
