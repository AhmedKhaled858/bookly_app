import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_search_textfield.dart';
import 'search_result_listview.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextField(),
          const SizedBox(height: 15),
          Text(
            "Search Result",
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          // Wrap in SizedBox to constrain height inside SliverToBoxAdapter
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6, // Or another height
            child: const SearchResultListView(),
          ),
        ],
      ),
    );
  }
}

