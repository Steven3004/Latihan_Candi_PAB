import 'package:flutter/material.dart';
import 'screens/detail_screen.dart';
import 'data/candi_data.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Wisata Candi',
    home: DetailScreen(candi: candiList[0]),
  );
}
}