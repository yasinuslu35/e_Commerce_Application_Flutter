// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemplateViewModel on _TemplateViewModelBase, Store {
  late final _$_selectedIndexAtom =
      Atom(name: '_TemplateViewModelBase._selectedIndex', context: context);

  @override
  int get _selectedIndex {
    _$_selectedIndexAtom.reportRead();
    return super._selectedIndex;
  }

  @override
  set _selectedIndex(int value) {
    _$_selectedIndexAtom.reportWrite(value, super._selectedIndex, () {
      super._selectedIndex = value;
    });
  }

  late final _$_TemplateViewModelBaseActionController =
      ActionController(name: '_TemplateViewModelBase', context: context);

  @override
  void onItemTapped(int value) {
    final _$actionInfo = _$_TemplateViewModelBaseActionController.startAction(
        name: '_TemplateViewModelBase.onItemTapped');
    try {
      return super.onItemTapped(value);
    } finally {
      _$_TemplateViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
