import 'package:addfunction/addfuctionpage.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 4, 20, 127)),
        useMaterial3:false,
      ),
      home:AddlistPage()
    );
  }
}


