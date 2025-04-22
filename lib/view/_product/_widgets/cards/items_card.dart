
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/_product/_constants/image_constants.dart';
import 'package:e_commerce_application/view/_product/_widgets/title/items_title_row.dart';
import 'package:e_commerce_application/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  final ProfileViewModel viewModel;
  final String titleText;

  const ItemsCard({
    super.key,
    required this.viewModel,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.width * 0.03,
        ),
        ItemsTitleRow(
            titleText: titleText),
        SizedBox(
          height: context.width * 0.03,
        ),
        buildNewItemsCard(context),
      ],
    );
  }

  SizedBox buildNewItemsCard(BuildContext context) {
    return SizedBox(
      height: context.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width * 0.4,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      ImageConstants.instance.hotDog,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: context.width * 0.4,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          " Bargello ",
                          // Veritabanından gelicek buraya data
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Erkek parfümü gri",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    ...viewModel.starList,
                    const Text("(1094)"),
                  ],
                ),
                const Spacer(),
                Text(
                  " 400 TL",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
