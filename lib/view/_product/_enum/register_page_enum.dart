enum RegisterUrlSuffixes { ISUSEREXIST, SIGNUP, GOOGLE }

enum RegisterQueryParameters {
  USERNAME,
}

extension RegisterQueryParametersExtension on RegisterQueryParameters {
  MapEntry<String, dynamic> rawValue(dynamic value) {
    switch (this) {
      case RegisterQueryParameters.USERNAME:
        return MapEntry("username", value);
    }
  }
}

extension RegisterUrlSuffixesExtension on RegisterUrlSuffixes {
  String get rawValue {
    switch (this) {
      case RegisterUrlSuffixes.ISUSEREXIST:
        return 'IsuserExist';
      case RegisterUrlSuffixes.GOOGLE:
        return 'google';
      case RegisterUrlSuffixes.SIGNUP:
        return 'signup';
    }
  }
}
