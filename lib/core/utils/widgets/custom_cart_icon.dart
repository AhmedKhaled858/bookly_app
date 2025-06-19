import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../features/home/presentation/manager/cart_provider.dart';
import '../app_router.dart';

class CustomCartIcon extends StatelessWidget {
  const CustomCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
        final cartCount = context.watch<CartProvider>().cartBooks.length;

    return  Stack(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kCartView);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 28,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              if (cartCount > 0)
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                    child: Center(
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
  }
}