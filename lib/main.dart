import 'package:buddy_savings/src/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const KwabaApp());
}

class KwabaApp extends StatelessWidget {
  const KwabaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kwaba',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
