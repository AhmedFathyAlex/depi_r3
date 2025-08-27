import 'package:depi_flutter/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var cart = cartProvider.cart;
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Center(
        child:
            cart.isEmpty
                ? Text('No items in cart')
                : ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    var item = cart[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(item),
                        cart.contains(item)
                            ? IconButton(
                              onPressed: () {
                                cartProvider.removeItem(item);
                              },
                              icon: Icon(Icons.delete),
                            )
                            : TextButton(
                              onPressed: () {
                                cartProvider.addItem(item);
                              },
                              child: Text('Add'),
                            ),
                      ],
                    );
                  },
                ),
      ),
    );
  }
}
