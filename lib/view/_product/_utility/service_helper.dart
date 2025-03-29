import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

mixin class ServiceHelper {
  void showMessage(
    GlobalKey<ScaffoldState>? scaffoldKey,
    IErrorModel<dynamic>? errorModel,
  ) {
    if (scaffoldKey == null || errorModel == null) return;

    if (scaffoldKey.currentContext == null) return;
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
          content: Text(
        errorModel.description ?? errorModel.statusCode.toString(),
      )),
    );
  }
}
