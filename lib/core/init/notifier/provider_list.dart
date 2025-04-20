import 'package:e_commerce_application/core/init/notifier/user_notifier.dart';

import '../navigation/navigation_service.dart';
import 'theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  ApplicationProvider._init();

  static ApplicationProvider? _instance;

  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    Provider.value(value: NavigationService.instance),
    ChangeNotifierProvider(
      create: (context) => UserNotifier(),
    ),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
