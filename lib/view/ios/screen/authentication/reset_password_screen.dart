import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/widget/primary_button.dart';
import 'package:dart_counter/view/ios/widget/textfield.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/authentication/reset_password_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Screen<ResetPasswordViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(
                  flex: 105,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Spacer(flex: 120,),
                      Flexible(child: Image.asset(AppImages.logo), flex: 135,),
                      Spacer(flex: 120,),
                    ],
                  ),
                  flex: 166,
                ),
                Spacer(
                  flex: 67,
                ),
                Expanded(child: Text("H1"), flex: 21),
                Spacer(
                  flex: 28,
                ),
                Expanded(child: Text("H2"), flex: 32),
                Spacer(
                  flex: 28,
                ),
                Expanded(
                  child: TextField(
                    placeholder: AppLocalizations.of(context).email,
                    controller: emailController,
                  ),
                  flex: 36,
                ),
                Spacer(
                  flex: 47,
                ),
                Expanded(
                  child: PrimaryButton(
                    text: AppLocalizations.of(context).confirm,
                    onPressed: () => model.onConfirmPressed(email: emailController.text),
                  ),
                  flex: 50,
                ),
                Spacer(
                  flex: 158,
                ),
              ],
            ),
          ),
        ),
      );
    });

    return Screen<ResetPasswordViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Spacer(
                      flex: 105,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Spacer(flex: 120,),
                          Flexible(child: Image.asset(AppImages.logo), flex: 135,),
                          Spacer(flex: 120,),
                        ],
                      ),
                      flex: 166,
                    ),
                    Spacer(
                      flex: 88,
                    ),
                    Expanded(child: Text("H1"), flex: 21),
                    Spacer(
                      flex: 28,
                    ),
                    Expanded(child: Text("H2"), flex: 32),
                    Spacer(
                      flex: 93,
                    ),
                    Expanded(
                      child: PrimaryButton(
                        text: AppLocalizations.of(context).login,
                        onPressed: () => model.onConfirmPressed(email: emailController.text),
                      ),
                      flex: 50,
                    ),
                    Spacer(
                      flex: 158,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}


// On Succes show this view
/**

    return CupertinoPageScaffold(
    child: SafeArea(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    children: [
    Spacer(
    flex: 105,
    ),
    Expanded(
    child: Row(
    children: [
    Spacer(flex: 120,),
    Flexible(child: Image.asset(AppImages.logo), flex: 135,),
    Spacer(flex: 120,),
    ],
    ),
    flex: 166,
    ),
    Spacer(
    flex: 88,
    ),
    Expanded(child: Text("H1"), flex: 21),
    Spacer(
    flex: 28,
    ),
    Expanded(child: Text("H2"), flex: 32),
    Spacer(
    flex: 93,
    ),
    Expanded(
    child: PrimaryButton(
    text: AppLocalizations.of(context).login,
    onPressed: () => model.onConfirmPressed(email: emailController.text),
    ),
    flex: 50,
    ),
    Spacer(
    flex: 158,
    ),
    ],
    ),
    ),
    ),
    );

**/