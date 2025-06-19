// ignore_for_file: deprecated_member_use

import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/colors/app_color.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manager/cart_provider.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartBooks = cartProvider.cartBooks;

    final ThemeData theme = Theme.of(context);
    final Color textColor = theme.brightness == Brightness.dark
        ? AppColors.darkTextColor
        : AppColors.lightTextColor;

    return SafeArea(
      child: cartBooks.isEmpty
          ? const Center(child: Text("No books in cart"))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: cartBooks.length,
              itemBuilder: (context, index) {
                BookEntity book = cartBooks[index];
                return Dismissible(
                  key: Key(book.bookId), // Make sure `book.id` is unique
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) {
                    cartProvider.removeFromCart(book);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${book.title} removed from cart')),
                    );
                  },
                  child: Card(
                    color: Colors.white.withOpacity(0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: (book.image != null && book.image!.isNotEmpty)
                          ? Image.network(
                              book.image!,
                              width: 40,
                              height: 60,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.book, color: Colors.white),
                      title: Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        book.title,
                        style: Styles.textStyle16.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        book.autherName ?? 'Unknown Author',
                        style: Styles.textStyle14.copyWith(color: textColor),
                      ),
                      trailing: Text(
                        "${book.price}€",
                        style: Styles.textStyle14.copyWith(color: textColor),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
