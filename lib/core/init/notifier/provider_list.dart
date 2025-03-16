import 'package:e_commerce_application/core/init/cache/locale_manager.dart';
import 'package:e_commerce_application/core/init/navigation/navigation_service.dart';
import 'package:e_commerce_application/core/init/notifier/theme_notifier.dart';
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
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
