// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_form_field_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextFormFieldViewModel on _TextFormFieldViewModelBase, Store {
  late final _$isPasswordVisibleAtom = Atom(
      name: '_TextFormFieldViewModelBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$_TextFormFieldViewModelBaseActionController =
      ActionController(name: '_TextFormFieldViewModelBase', context: context);

  @override
  void changePasswordVisibility() {
    final _$actionInfo =
        _$_TextFormFieldViewModelBaseActionController.startAction(
            name: '_TextFormFieldViewModelBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$_TextFormFieldViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordVisible: ${isPasswordVisible}
    ''';
  }
}
