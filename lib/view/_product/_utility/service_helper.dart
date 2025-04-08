import 'package:flutter/material.dart';

mixin class ServiceHelper {
  void showMessage(
      GlobalKey<ScaffoldState>? scaffoldKey,
      Map<String, dynamic>? errorModel,
      ) {
    if (scaffoldKey == null || errorModel == null) return;

    final valuesList = errorModel.values
        .where((element) => element != null && element is! int)
        .toList();

    if (scaffoldKey.currentContext == null) return;
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
          content: ListView.builder(
            itemCount: valuesList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Text(valuesList[index].toString());
            },
          )),
    );
  }
}