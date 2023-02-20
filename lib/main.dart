import 'package:flutter/material.dart';
import 'package:i_barber/shared/shared_screens/home_page_screen.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}