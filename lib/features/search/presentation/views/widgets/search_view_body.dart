import 'package:bookly_app/core/utils/widgets/custom_app_bar_widget.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_section.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomAppBarWidget(title: 'Search',),
        ),
        SliverToBoxAdapter(
          child: SearchSection(),
        )
        
      ],
    );
  }
}
