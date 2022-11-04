// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newsapp/views/homescreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF12173A),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.purple,
        primary: Color(0xFF090D22),
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Homepage(),
    },
  ));
}
