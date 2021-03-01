import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/routes.dart';
import 'package:dart_counter/view/ios/widget/link_button.dart';
import 'package:dart_counter/view/ios/widget/primary_button.dart';
import 'package:dart_counter/view/ios/widget/textfield.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/authentication/sign_up_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Screen<SignUpViewModel>(builder: (context, model, child) {
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
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Spacer(flex: 120,),
                      Flexible(child: Image.asset(AppImages.logo), flex: 164,),
                      Spacer(flex: 58,),
                      Expanded(
                        child: TextField(
                          placeholder: AppLocalizations.of(context).email,
                          controller: emailController,
                        ),
                        flex: 36,
                      ),
                      Spacer(flex: 15,),
                      Expanded(
                        child: TextField(
                          placeholder: AppLocalizations.of(context).username,
                          controller: usernameController,
                        ),
                        flex: 36,
                      ),
                      Spacer(flex: 15,),
                      Expanded(
                        child: TextField(
                          placeholder: AppLocalizations.of(context).password,
                          controller: passwordController,
                        ),
                        flex: 36,
                      ),
                      Spacer(flex: 15,),
                      Expanded(
                        child: TextField(
                          placeholder: AppLocalizations.of(context).passwordAgain,
                          controller: passwordAgainController,
                        ),
                        flex: 36,
                      ),
                      Spacer(flex: 25,),
                      Expanded(
                        child: PrimaryButton(
                          text: AppLocalizations.of(context).register,
                          onPressed: () => model.onRegisterPressed(email: emailController.text, password: passwordController.text),
                        ),
                        flex: 50,
                      ),
                      Spacer(flex: 16,),
                      Flexible(
                        child: LinkButton(
                          text: AppLocalizations.of(context).login,
                          onPressed: () => Navigator.pushNamed(context, Routes.signIn),
                        ),
                        flex: 17,
                      ),
                      Spacer(flex: 147,),
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
    usernameController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    super.dispose();
  }
}
