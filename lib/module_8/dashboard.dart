import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  // final String phone;
  // final String ? password;
  Dashboard({
    super.key,
    // required this.phone, this.password
  });

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          args['phone'].toString(),
          style: TextStyle(fontSize: 50, color: Colors.blue),
        ),
      ),
    );
  }
}
