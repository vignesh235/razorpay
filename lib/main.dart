import 'package:flutter/material.dart';
import 'package:razor_payment/payment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: payment(),
    );
  }
}


