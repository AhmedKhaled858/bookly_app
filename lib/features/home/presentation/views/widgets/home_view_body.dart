import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FeaturedBooksListView(),
              ),
              SizedBox(height: 33),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  "Best Seller",
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w900,
                    // fontFamily: kGTSectraFine
                  ),
                ),
              ),

              //  Padding(
              //    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              //    child: BestSellerListViewItem(),
            ],
          ),
        ),
        SliverToBoxAdapter(child: BestSellerListView()),
      ],
    );
  }
}
