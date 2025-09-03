import 'package:depi_flutter/state_managment/cart_provider.dart';
import 'package:depi_flutter/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class MyCatalog extends StatelessWidget {
  final List<String> wholeList = ['first', 'second', 'third', 'forth', 'fifth'];

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var cart = cartProvider.cart;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My catalog'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: badges.Badge(
                badgeContent: Text(cart.length.toString()),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cart()),
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            var item = wholeList[index];
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
          itemCount: wholeList.length,
        ),
      ),
    );
  }
}
