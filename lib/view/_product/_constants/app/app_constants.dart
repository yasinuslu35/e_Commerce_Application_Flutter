class ApplicationConstants {
  static const LANG_ASSET_PATH = "asset/lang";

  static const EMAIL_REGEX =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String USERNAME_REGEX =
      r'^[a-zA-Z0-9](?!.*[_.]{2})[a-zA-Z0-9._]{1,14}[a-zA-Z0-9]$';

  static const String PASSWORD_REGEX =
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{6,}$';

  static const FONT_FAMILY = "POPPINS";

  static const CLIENT_ID_MOBILE = "257648859794-mav6itv5isaj6tg251dpjekrqqtfdpdu.apps.googleusercontent.com";
  static const CLIENT_ID_WEB = "257648859794-ej505a7454pruereqdp7vm1q1006a7uq.apps.googleusercontent.com";

  // production'da olmadığımız sürece çalışmasını istemediğimiz fonksiyonlar için kullanacağız
  static const TEST_MODE = true;
}
