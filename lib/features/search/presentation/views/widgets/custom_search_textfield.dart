import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildOutlLineInputBorder(),
        focusedBorder: buildOutlLineInputBorder(),
        hintText: "Enter the book name",
        hintStyle: Styles.textStyle14,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: .7,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 24),
          ),
        ),
        labelText: "Search",
        labelStyle: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  OutlineInputBorder buildOutlLineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
