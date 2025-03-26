class LoginModel {
  final String tab1;
  final String tab2;
  final String email;
  final String password;
  final String forgotText;
  final String loginButtonText;
  final String dontAccount;
  final String? validUsername;
  final String? validPassword;

  LoginModel({
    required this.tab1,
    required this.tab2,
    required this.email,
    required this.password,
    required this.forgotText,
    required this.loginButtonText,
    required this.dontAccount,
    this.validUsername,
    this.validPassword,
  });
}
