import 'package:flutter/material.dart';
import 'package:flutter_frontend_tcc/page/Home/MyHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nosso Restaurante',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(), // Passa o título aqui
    );
  }
}
