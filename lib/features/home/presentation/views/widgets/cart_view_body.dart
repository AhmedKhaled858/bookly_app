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
          // SliverAppBar(
          //   pinned: true,
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   leading: IconButton(
          //     icon: Icon(Icons.arrow_back, 
          //      color: Theme.of(context).brightness == Brightness.dark
          //     ? Colors.white
          //     : Colors.black,),
          //     onPressed: () => Navigator.pop(context),
          //   ),
          //   title: Text(
          //     'Your Cart',
          //     style: TextStyle( color: Theme.of(context).brightness == Brightness.dark
          //     ? Colors.white
          //     : Colors.black,),
          //   ),
          //   centerTitle: true,
          // ),
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
