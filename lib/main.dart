import 'package:flutter/material.dart';
import 'package:furniture_app/ui/views/detail_view/detail_view.dart';
import 'package:furniture_app/ui/views/home/home.dart';
import 'package:furniture_app/ui/views/main_view/main_view.dart';
import 'package:furniture_app/ui/widgets/bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4niture',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color(0xFF6E3B3B)),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DetailView(),
    );
  }
}

