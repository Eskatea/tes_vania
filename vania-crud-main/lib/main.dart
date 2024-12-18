import 'package:belajar_api_vania/app/models/userpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyaApp());
}

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserPage()
      );
    }
  }