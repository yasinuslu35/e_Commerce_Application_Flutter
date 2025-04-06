// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_board_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnBoardViewModel on _OnBoardViewModelBase, Store {
  late final _$currentPageIndexAtom =
      Atom(name: '_OnBoardViewModelBase.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_OnBoardViewModelBase.isLoading', context: context);

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

  late final _$_OnBoardViewModelBaseActionController =
      ActionController(name: '_OnBoardViewModelBase', context: context);

  @override
  void onPageChanged(int value) {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.onPageChanged');
    try {
      return super.onPageChanged(value);
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void prevButton() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.prevButton');
    try {
      return super.prevButton();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextButton() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.nextButton');
    try {
      return super.nextButton();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
isLoading: ${isLoading}
    ''';
  }
}
