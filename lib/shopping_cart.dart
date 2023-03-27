import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'books_provider.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var books = context.watch<BooksProvider>().books;
    var cartItems = context.watch<BooksProvider>().cartList;
    double totalAmount = context.watch<BooksProvider>().total;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: cartItems.isEmpty ? Center(
        child: Text("No item found in cart"),
      ) :
      ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (BuildContext context, int index){
            final book = books[cartItems[index]];
            return ListTile(
              leading: Image.network(
                book['imageUrl'],
                width: 50,
                height: 50,
              ),
              title: Text(book['name'] +" : ₹ " + book['price'].toString()),
              trailing: GestureDetector(
                  onTap: () {
                    context.read<BooksProvider>().removeFromList(cartItems[index]);
                  },
                  child: const Icon(Icons.remove_shopping_cart, color: Colors.red,)
              ),
            );
      }),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(child: ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: Text("${cartItems.length} items"),
            )),
            Expanded(child: ListTile(title: Text("Total: ₹ ${totalAmount.toString()}"),)
            )
          ],
        ),
      ),
    );
  }
}
