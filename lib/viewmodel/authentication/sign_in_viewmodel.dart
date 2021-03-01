import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

enum SignInViewState { idle, loading }

class SignInViewModel extends ViewModel<SignInViewState> {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  SignInViewModel() {
    viewState = SignInViewState.idle;
  }

  Future<void> onSignPressed({String email, String password}) async {
    if (!EmailValidator.validate(email.trim()) || !PasswordValidator.validate(password.trim())) {
      throw InvalidEmailAddressOrPasswordError();
    }

    viewState = SignInViewState.loading;
    try {
      await _authenticationService.signIn(email: email, password: password);
      viewState = SignInViewState.idle;
    } on Error catch(e) {
      viewState = SignInViewState.idle;
      throw e;
    }
    //await Future.delayed(const Duration(seconds: 1), () {});
  }

  void onSignInFacebookPressed() {
    _authenticationService.signInFacebook();
  }

  void onSignInGooglePressed() {
    _authenticationService.signInGoogle();
  }

  void onSignInInstagramPressed() {
    _authenticationService.signIn();
  }
}
