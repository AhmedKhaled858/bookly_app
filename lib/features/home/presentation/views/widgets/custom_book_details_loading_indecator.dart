import 'package:bookly_app/core/utils/widgets/custom_fading_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';

import 'book_description_loading_indecator.dart';
import 'book_details_section_loading_indecator.dart';

class BookDetailsLoadingIndicator extends StatelessWidget {
  const BookDetailsLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: CustomScrollView(
      slivers: [
          const SliverToBoxAdapter(child: CustomBookDetailsAppBar()),
          SliverToBoxAdapter(child: BookDetailsSectionLoadingIndicator()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: BookDescriptionLoadingIndicator()),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
        ],
      ),
    
    );
  }
}
