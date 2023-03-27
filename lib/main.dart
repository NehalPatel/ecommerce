import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'books_provider.dart';
import 'home_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (_) => BooksProvider(),
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
