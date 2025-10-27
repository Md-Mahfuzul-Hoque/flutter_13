import 'package:flutter/material.dart';


class Deshboard extends StatelessWidget {
  final String phone;
  final String ? password;
   Deshboard({super.key, required this.phone, this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(phone,
        style: TextStyle(
          fontSize: 50,
          color: Colors.blue
        ),
        ),
      ),
    );
  }
}
