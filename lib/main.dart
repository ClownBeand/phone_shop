import 'package:electronics/models/shop.dart';
import 'package:electronics/pages/cart_page.dart';
import 'package:electronics/pages/home_page.dart';
import 'package:electronics/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Shop',
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/homepage': (context) => const HomePage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
