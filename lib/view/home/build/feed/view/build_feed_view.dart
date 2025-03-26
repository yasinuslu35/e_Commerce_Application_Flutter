import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/view/home/build/feed/viewmodel/build_feed_view_model.dart';
import 'package:flutter/material.dart';

class BuildFeedView extends StatelessWidget {
  const BuildFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.format_align_center,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              )
            ],
          ),
          //body: DefaultTabController(length: 4, child: child),
        );
      },
    );
  }
}
