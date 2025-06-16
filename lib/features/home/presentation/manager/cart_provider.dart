import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/book_model/book_model.dart'; // Make sure this exists
import '../../domain/entities/book_entity.dart';

class CartProvider extends ChangeNotifier {
  final List<BookEntity> _cartBooks = [];

  List<BookEntity> get cartBooks => _cartBooks;

  CartProvider() {
    _loadCart();
  }

  void addToCart(BookEntity book) {
    if (!_cartBooks.contains(book)) {
      _cartBooks.add(book);
      _saveCart();
      notifyListeners();
    }
  }

  void removeFromCart(BookEntity book) {
    _cartBooks.remove(book);
    _saveCart();
    notifyListeners();
  }

  void clearCart() {
    _cartBooks.clear();
    _saveCart();
    notifyListeners();
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = jsonEncode(_cartBooks.map((b) => (b as BookModel).toJson()).toList());
    await prefs.setString('cart_books', cartJson);
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString('cart_books');
    if (cartJson != null) {
      final List<dynamic> jsonList = jsonDecode(cartJson);
      _cartBooks.clear();
      _cartBooks.addAll(jsonList.map((json) => BookModel.fromJson(json)));
      debugPrint('Loaded cart: ${_cartBooks.map((e) => e.title).toList()}');
      notifyListeners();
    } else {
      debugPrint('No saved cart found');
    }
  }
}
