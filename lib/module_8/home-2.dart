import 'package:flutter/material.dart';

class HomeTwo extends StatelessWidget {
  const HomeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HomeTwo',
              style: TextStyle(
                color: Colors.red
              ),
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: (){
              Navigator.pop(context);
            },

                child: Text('Back'))
          ],

        ),
      ),
    );
  }
}
