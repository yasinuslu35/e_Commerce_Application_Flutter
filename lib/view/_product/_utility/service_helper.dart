import 'package:e_commerce_application/core/base/model/error/error_data_result.dart';
import 'package:flutter/material.dart';

mixin class ServiceHelper {
  void showMessage(
    //GlobalKey<ScaffoldState>? scaffoldKey,
    ErrorDataResult? errorModel,
    BuildContext? context,
  ) {
    if (errorModel == null) return;
    List<String> valuesList = [];
    valuesList.add(
      errorModel.data
              ?.toJson()
              ?.values
              .where((element) => element != null && element is! int)
              .toString() ??
          "",
    );

    if (context == null) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          errorModel.message ?? "",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        content: errorModel.data == null
            ? null
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  valuesList.length,
                  (index) => Text(
                    valuesList[index].toString(),
                  ),
                ),
              ),
        actions: [
          TextButton(
            child: Text("Tamam"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
    /*
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
     */
  }
}
