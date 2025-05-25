import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            child: CustomBookImage(),
          );
        },
      ),
    );
  }
}
