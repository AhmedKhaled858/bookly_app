import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_list_view_bloc_consumer.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/colors/app_color.dart';
import 'featured_book_list_view_bloc_consumer.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color textColor = theme.brightness == Brightness.dark
        ? AppColors.darkTextColor
        : AppColors.lightTextColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: FeaturedBookListViewBlocConsumer(),
        ),
        const SizedBox(height: 33),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "Newest Book",
            style: Styles.textStyle18.copyWith(
              color: textColor,
            ),
          ),
        ),
        const SizedBox(height: 16),
        //  This makes the list scrollable inside remaining screen
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: NewestBookListViewBlocConsumer(),
          ),
        ),
      ],
    );
  }
}
