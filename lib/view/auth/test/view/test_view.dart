import 'package:e_commerce_application/core/base/state/base_state.dart';
import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/cache/locale_manager.dart';
import 'package:e_commerce_application/core/init/lang/language_service.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/auth/test/viewmodel/test_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestsView extends StatefulWidget {
  const TestsView({super.key});

  @override
  State<TestsView> createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  late TestViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onPageBuilder: (context, value) {
        return scaffoldBody;
      },
    );
  }

  Widget get scaffoldBody {
    return Scaffold(
      appBar: AppBar(
        leading: Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
        title: textWelcomeWidget,
        actions: [
          iconButtonChangeTheme,
        ],
      ),
      floatingActionButton: floatingActionButtonNumberIncrement,
      body: textNumber,
    );
  }

  Text get textWelcomeWidget => Text(LocaleKeys.welcome.locale);

  IconButton get iconButtonChangeTheme {
    return IconButton(
      onPressed: () {
        context.setLocale(LanguageService.instance.enLocale);
        print("TOKEN VALUE: ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}");
      },
      icon: const Icon(Icons.change_history),
    );
  }

  Widget get textNumber {
    return Observer(
      builder: (context) => Text(
        viewModel.number.toString(),
      ),
    );
  }

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () {
        return viewModel.incrementNumber();
      },
    );
  }
}
