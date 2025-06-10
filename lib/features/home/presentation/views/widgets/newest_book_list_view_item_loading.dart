// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class NewestBookListItemLoading extends StatelessWidget {
  const NewestBookListItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          // Image Placeholder
          AspectRatio(
            aspectRatio: 2.7 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Placeholder
                  Container(
                    height: 18,
                    width: double.infinity,
                    color: Colors.grey
                  ),
                  // Author Placeholder
                  Container(
                    height: 14,
                    width: 100,
                    color: Colors.grey
                  ),
                  // Price + Rating Row Placeholder
                  Row(
                    children: [
                      Container(
                        height: 16,
                        width: 40,
                        color: Colors.grey
                      ),
                      const Spacer(),
                      Row(
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
