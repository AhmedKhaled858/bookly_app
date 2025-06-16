// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manager/cart_provider.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBooks = Provider.of<CartProvider>(context).cartBooks;

    return SafeArea(
      child: cartBooks.isEmpty
          ? const Center(child: Text("No books in cart"))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: cartBooks.length,
              itemBuilder: (context, index) {
                BookEntity book = cartBooks[index];
                return Card(
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
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      book.autherName ?? 'Unknown Author',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    trailing: Text(
                      "${book.price}€",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
