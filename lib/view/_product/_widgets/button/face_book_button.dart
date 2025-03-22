import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:flutter/material.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({super.key, this.onComplete});
  final void Function(FaceBookModel? data, {String? errorMessage})? onComplete;

  @override
  Widget build(BuildContext context) {
    return TitleElevatedButton(
      text: 'Facebbok login',
      onPressed: () {
        const isLengthSixCharacter = 'asdasdasd'.length == 6;

        if (isLengthSixCharacter) {
          onComplete!(FaceBookModel('asdasd', 'ASdasd'));
        } else {
          onComplete!(null, errorMessage: 'Facebook user not found');
        }
      },
    );
  }
}

class FaceBookModel {
  FaceBookModel(this.token, this.mail);

  final String token;
  final String mail;
}
