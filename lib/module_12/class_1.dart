import 'package:flutter/material.dart';
class StateClass extends StatefulWidget {
  StateClass({super.key});

  @override
  State<StateClass> createState() => _StateClassState();
}

class _StateClassState extends State<StateClass> {

  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Class',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( num.toString(),
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.teal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Spacer(),
                    IconButton(onPressed: (){
                      setState(() {
                        num++;
                        print(num);
                      });
                    }, icon:Icon(Icons.add),
                    ),
                    // Spacer(),
                    IconButton(onPressed: (){
                      setState(() {
                        num--;
                        print(num);
                      });
                    }, icon:Icon(Icons.minimize),
                    ),
                    // Spacer(),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}