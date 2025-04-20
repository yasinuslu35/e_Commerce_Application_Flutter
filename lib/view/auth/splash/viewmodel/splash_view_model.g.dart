// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on _SplashViewModelBase, Store {
  late final _$isFirstAppAtom =
      Atom(name: '_SplashViewModelBase.isFirstApp', context: context);

  @override
  bool get isFirstApp {
    _$isFirstAppAtom.reportRead();
    return super.isFirstApp;
  }

  bool _isFirstAppIsInitialized = false;

  @override
  set isFirstApp(bool value) {
    _$isFirstAppAtom.reportWrite(
        value, _isFirstAppIsInitialized ? super.isFirstApp : null, () {
      super.isFirstApp = value;
      _isFirstAppIsInitialized = true;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SplashViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_SplashViewModelBaseActionController =
      ActionController(name: '_SplashViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_SplashViewModelBaseActionController.startAction(
        name: '_SplashViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_SplashViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstApp: ${isFirstApp},
isLoading: ${isLoading}
    ''';
  }
}
