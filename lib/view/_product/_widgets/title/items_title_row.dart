import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ItemsTitleRow extends StatelessWidget {
  final String titleText;

  const ItemsTitleRow({
    super.key,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titleText.locale,
          style: context.textTheme.headlineLarge,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.home_profile_body_items_seeAllText.locale,
              style: context.textTheme.titleLarge,
            ),
            SizedBox(
              width: context.width * 0.03,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                size: context.width * 0.08,
                color: Colors.white,
              ),
              style: IconButton.styleFrom(
                shape: const CircleBorder(),
                padding: context.paddingLow,
                backgroundColor: context.myColors.appBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
