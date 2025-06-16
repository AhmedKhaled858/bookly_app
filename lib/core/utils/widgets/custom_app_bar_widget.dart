
import 'package:flutter/material.dart';

import '../styles.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String? title;
  const CustomAppBarWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Row(children: [
      IconButton(
        icon: Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      Expanded(
        child: Text(
          title??'',
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
         
        ),
      ),
    ],);
  }
}
