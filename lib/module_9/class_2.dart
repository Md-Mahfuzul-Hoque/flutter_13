import 'package:flutter/material.dart';

class FList extends StatelessWidget {
  const FList ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('List View',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context,index){
          return
            // Text('List-$index = ${index*12}');
          Card(
            child: ListTile(
              title: Text('Mahfuz'),
              subtitle: Text('01312266413'),
              leading: Icon(Icons.phone,color: Colors.green,),
              trailing: Icon(Icons.delete,color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
