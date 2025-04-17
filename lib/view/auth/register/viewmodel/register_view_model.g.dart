// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_RegisterViewModelBase.isLoading', context: context);

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

  late final _$fetchRegisterServiceAsyncAction = AsyncAction(
      '_RegisterViewModelBase.fetchRegisterService',
      context: context);

  @override
  Future<void> fetchRegisterService() {
    return _$fetchRegisterServiceAsyncAction
        .run(() => super.fetchRegisterService());
  }

  late final _$btnRegisterClickedAsyncAction = AsyncAction(
      '_RegisterViewModelBase.btnRegisterClicked',
      context: context);

  @override
  Future<void> btnRegisterClicked() {
    return _$btnRegisterClickedAsyncAction
        .run(() => super.btnRegisterClicked());
  }

  late final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase', context: context);

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
