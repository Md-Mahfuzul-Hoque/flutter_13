import 'package:flutter/material.dart';

class ThemeTest extends StatelessWidget {
  const ThemeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Test',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
        ),
      ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Test Text',
            style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 10),
            TextField(),
            SizedBox(
              height: 10,
            ),
            TextField(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text('Test Button'),
            ),
          ],
        ),
      ),
    );
  }
}
