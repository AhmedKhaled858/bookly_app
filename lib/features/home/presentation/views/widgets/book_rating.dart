import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,

      children: [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F), size: 19),
        SizedBox(width: 10),
        Text(
          '4.8',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        Opacity(opacity: .5, child: Text('(245)', style: Styles.textStyle16)),
      ],
    );
  }
}
