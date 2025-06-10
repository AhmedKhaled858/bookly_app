import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  //final int count;

  const BookRating({
    super.key,
    required this.rating,
 //   required this.count,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F), size: 19),
        const SizedBox(width: 10),
        Text(
          rating.toStringAsFixed(1),
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        // Opacity(
        //   opacity: .5,
        //   child: Text('($count)', style: Styles.textStyle16),
        // ),
      ],
    );
  }
}
