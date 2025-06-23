import 'package:bookly_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manager/cart_provider.dart';

class BookAction extends StatelessWidget {
  final BookEntity book;

  const BookAction({super.key, required this.book});
@override
Widget build(BuildContext context) {
  return Center( // ✅ Center the row
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600), // ✅ Limit the width on large screens
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: '${book.price}€',
                backgroundColor: Colors.white,
                textcolor: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  final cartProvider=Provider.of<CartProvider>(context, listen: false);
                  if (cartProvider.cartBooks.contains(book)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Book already in cart")),
                    );
                  
                  }else {
                    // Add the book to the cart
                    cartProvider.addToCart(book);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Book added to cart")),
                  );
                  } 
                  
                },
                fontsized: 16,
                text: "Add to cart",
                backgroundColor: const Color(0xffEF8262),
                textcolor: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}