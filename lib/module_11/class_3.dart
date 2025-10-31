import 'package:flutter/material.dart';

class Class3 extends StatelessWidget {
  const Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class 3',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: Column(
        children: [
          Text('Test',
          style: TextStyle(
            fontSize: 20
          ),
          ),
          Text('Test',
          style: TextStyle(
            fontSize: 20
          ),
          ),
          Text('Test',
          style: TextStyle(
            fontSize: 20
          ),
          ),
          Text('Test',
          style: TextStyle(
            fontSize: 20
          ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 20,
                itemBuilder: (context,index){
                return ListTile(
                  title: Text(index.toString()
                  ),
                );
                }
            ),
          ),

          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),


          Flexible(
            flex: 3,
            child: Container(
              // height: 200,
              // width: 200,
              color: Colors.teal,
            ),
          ),

          Flexible(
            flex: 1,
            child: Container(
              // height: 200,
              // width: 200,
              color: Colors.purple,
            ),
          ),

        ],
      ),
    );
  }
}
