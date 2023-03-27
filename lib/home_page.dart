import 'package:ecommerce/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'books_provider.dart';
import 'shopping_cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartItems = context.watch<BooksProvider>().cartList;
    var books = context.watch<BooksProvider>().books;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Book Shop"),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShoppingCart())
                    );
                  },
                  icon: const Icon(Icons.shopping_cart)
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    constraints: const BoxConstraints(
                      minHeight: 16,
                      minWidth: 16
                    ),
                    child: Text("${cartItems.length}", textAlign: TextAlign.center,),
                  )
              )
            ],
          )
        ],
      ),
      drawer: MyDrawer(),
      body: books.isEmpty ? const Center(
              child : Text("No Books Found")
          ) : ListView.builder(
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index){

                  final book = books[index];
                  return ListTile(
                    leading: Image.network(
                      book['imageUrl'],
                      width: 50,
                      height: 50,
                    ),
                    title: Text(book['name'] +" : ₹ " + book['price'].toString()),
                    trailing: GestureDetector(
                        onTap: () {
                          if(!cartItems.contains(index)){
                            context.read<BooksProvider>().addToList(index);
                          } else {
                            context.read<BooksProvider>().removeFromList(index);
                          }
                        },
                        child: Icon(
                          !cartItems.contains(index) ? Icons.add_shopping_cart : Icons.remove_shopping_cart,
                          color: cartItems.contains(index) ? Colors.red : Colors.grey,
                        )
                    ),
                  );
                }
              ),
    );
  }
}
