import 'package:bookly_app/core/utils/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarWidget(title: 'Your Cart',),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height, // Allow list to scroll
              child: const CartListView(),
            ),
          ),
        ],
      ),
    );
  }
}
