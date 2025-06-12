import 'package:bookly_app/core/utils/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import 'newest_book_list_view_item_loading.dart';

class NewestBookListViewLoadingIndicator extends StatelessWidget {
  const NewestBookListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .8,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: NewestBookListItemLoading(),
            );
          },
        ),
      ),
    );
  }
}
