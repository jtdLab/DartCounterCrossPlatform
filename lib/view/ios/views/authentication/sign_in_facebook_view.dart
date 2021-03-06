import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/authentication/sign_in_facebook_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInFacebookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignInFacebookViewModel>(builder: (context, model, child) {
      return View(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text(AppLocalizations.of(context).cancel),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text('SignIn facebook title - TODO'),
        ),
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
