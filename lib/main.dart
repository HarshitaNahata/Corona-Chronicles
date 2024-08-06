import 'package:covid/datasource.dart';
import 'package:covid/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Circular',
      primaryColor: primaryBlack,
    ),
    home: HomePage(),
  ));
}
