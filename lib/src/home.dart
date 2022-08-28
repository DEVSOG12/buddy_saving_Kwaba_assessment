import 'package:buddy_savings/src/screens/create_savings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kwaba'),
      ),
      body: Center(
        child: MaterialButton(
          color: const Color(0xff413d95),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CreateSavings())),
          child: const Text(
            'Home Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
