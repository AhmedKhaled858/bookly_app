import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildOutlLineInputBorder(context),
        focusedBorder: buildOutlLineInputBorder(context),
        hintText: "Enter the book name",
        hintStyle: Styles.textStyle14.copyWith(
          color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: .7,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 24,
            color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        labelText: "Search",
        labelStyle: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,),
      ),
    );
  }

  OutlineInputBorder buildOutlLineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
