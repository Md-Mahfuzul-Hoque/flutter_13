import 'package:flutter/material.dart';

class Buttongrp extends StatelessWidget {
  const Buttongrp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Group', style: TextStyle(color: Colors.white)),

        centerTitle: true,

        backgroundColor: Colors.blue,
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,

                  foregroundColor: Colors.black,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),

                onPressed: () {},

                child: Text('Submit'),
              ),

              SizedBox(height: 50),

              SizedBox(
                height: 50,

                width: 300,

                // width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,

                    foregroundColor: Colors.black,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),

                  onPressed: () {},

                  child: Text('Submit'),
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 50,

                width: 300,

                child: OutlinedButton(
                  onPressed: () {},

                  child: Text('Outline Button'),
                ),
              ),

              TextButton(onPressed: () {}, child: Text('Read More')),

              SizedBox(height: 20),

              Icon(Icons.phone_android, size: 50, color: Colors.red),

              SizedBox(height: 20),

              IconButton(
                onPressed: () {},

                icon: Icon(Icons.delete, size: 50, color: Colors.red),
              ),

              SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  print('Single Tap');
                },

                onDoubleTap: () {
                  print('Double Click');
                },

                onLongPress: () {
                  print('Long Press');
                },

                child: Text('This is test text'),
              ),

              SizedBox(height: 20),

              InkWell(
                onTap: () {
                  print('Single Tap');
                },

                onDoubleTap: () {
                  print('Double Click');
                },

                onLongPress: () {
                  print('Long Press');
                },

                child: Text('Test 2', style: TextStyle(fontSize: 50)),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,

        foregroundColor: Colors.white,

        onPressed: () {
          print('Click on Add');
        },

        child: Icon(Icons.add),
      ),
    );
  }
}

// for screen size button
// SizedBox(
//
// height: double.infinity,
// width: double.infinity,
// )
