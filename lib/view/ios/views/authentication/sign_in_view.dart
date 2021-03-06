import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/views/authentication/reset_password_view.dart';
import 'package:dart_counter/view/ios/views/authentication/sign_in_facebook_view.dart';
import 'package:dart_counter/view/ios/views/authentication/sign_in_google_view.dart';
import 'package:dart_counter/view/ios/views/authentication/sign_in_instagram_view.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/link_button.dart';
import 'package:dart_counter/view/ios/widgets/button/primary_text_button.dart';
import 'package:dart_counter/view/ios/widgets/button/social_media_button.dart';
import 'package:dart_counter/view/ios/widgets/textfield.dart';
import 'package:dart_counter/view/toast.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/authentication/sign_in_viewmodel.dart';
import 'package:dart_counter/viewmodel/enum/social_media_button_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SignInView extends StatefulWidget {
  final PageController pageController;

  SignInView(this.pageController);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return ViewModelProvider<SignInViewModel>(
      builder: (context, model, child) => View(
        onTap: () => node.unfocus(),
        child: model.viewState == SignInViewState.idle
            ? SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Builder(
                  builder: (context) => ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Row(
                      children: [
                        Spacer(
                          flex: 38,
                        ),
                        Expanded(
                          flex: 299,
                          child: Column(
                            children: [
                              Spacer(
                                flex: 99,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Spacer(
                                      flex: 120,
                                    ),
                                    Expanded(
                                      child: Image.asset(AppImages.logo),
                                      flex: 135,
                                    ),
                                    Spacer(
                                      flex: 120,
                                    ),
                                  ],
                                ),
                                flex: 166,
                              ),
                              Spacer(
                                flex: 107,
                              ),
                              Expanded(
                                child: TextField(
                                  placeholder: AppLocalizations.of(context).email,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                ),
                                flex: 36,
                              ),
                              Spacer(
                                flex: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  placeholder: AppLocalizations.of(context).password,
                                  controller: passwordController,
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                  onEditingComplete: () => node.unfocus(),
                                ),
                                flex: 36,
                              ),
                              Spacer(
                                flex: 25,
                              ),
                              Expanded(
                                child: PrimaryTextButton(
                                    text: AppLocalizations.of(context).login,
                                    onPressed: () {
                                      // TODO this is only a workaround find a better solution for this e.g with global key
                                      var errorMessages = {
                                        'errorInvalidEmailAddressOrPassword':
                                            AppLocalizations.of(context).errorInvalidEmailAddressOrPassword,
                                        'errorNetwork': AppLocalizations.of(context).errorNetwork,
                                      };

                                      model
                                          .onSignInPressed(
                                              email: emailController.text, password: passwordController.text)
                                          .catchError((error) {
                                        if (error is InvalidEmailAddressOrPasswordError) {
                                          Toast.showToast(
                                              errorMessages['errorInvalidEmailAddressOrPassword']);
                                        } else {
                                          Toast.showToast(errorMessages['errorNetwork']);
                                        }
                                      });
                                    }),
                                flex: 50,
                              ),
                              Spacer(
                                flex: 15,
                              ),
                              Flexible(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(6.0, 0, 0, 0),
                                    child: Builder(
                                      builder: (context) => LinkButton(
                                        text: AppLocalizations.of(context).forgotPassword,
                                        onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                                          expand: true,
                                          context: context,
                                          backgroundColor: AppColors.transparent,
                                          builder: (context) => ResetPasswordView(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                flex: 17,
                              ),
                              Spacer(
                                flex: 53,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Builder(
                                      builder: (context) => SocialMediaButton(
                                        type: SocialMediaButtonType.facebook,
                                        onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                                          expand: true,
                                          context: context,
                                          backgroundColor: AppColors.transparent,
                                          builder: (context) => SignInFacebookView(),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => SocialMediaButton(
                                        type: SocialMediaButtonType.google,
                                        onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                                          expand: true,
                                          context: context,
                                          backgroundColor: AppColors.transparent,
                                          builder: (context) => SignInGoogleView(),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => SocialMediaButton(
                                        type: SocialMediaButtonType.instagram,
                                        onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                                          expand: true,
                                          context: context,
                                          backgroundColor: AppColors.transparent,
                                          builder: (context) => SignInInstagramView(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                flex: 48,
                              ),
                              Spacer(
                                flex: 30,
                              ),
                              Flexible(
                                child: LinkButton(
                                  text: AppLocalizations.of(context).registerNow,
                                  onPressed: () => widget.pageController.animateToPage(1,
                                      duration: Duration(milliseconds: 500), curve: Curves.easeIn),
                                ),
                                flex: 17,
                              ),
                              Spacer(
                                flex: 16,
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 38,
                        )
                      ],
                    ),
                  ),
                ),
              )
            : LoadingView(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
