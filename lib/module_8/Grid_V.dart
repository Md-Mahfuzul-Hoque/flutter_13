import 'package:flutter/material.dart';

class GridV extends StatelessWidget {
  const GridV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid_V', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 25,
          mainAxisExtent: 150,
        ),
        itemCount: 20,
        itemBuilder: (context,index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity, // or remove width too
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.phone, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Phone',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        }
      ),

      // GridView.count(
      //   crossAxisCount: 3,
      //   padding: EdgeInsets.all(10),
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   children: List.generate(
      //     10,
      //     (index) => Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         width: 150,
      //         height: 150,
      //
      //         decoration: BoxDecoration(
      //           // color: Colors.teal,
      //           gradient: LinearGradient(
      //             colors: [Colors.red, Colors.red],
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //           ),
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey,
      //               blurRadius: 15,
      //               offset: Offset(0, 10),
      //             ),
      //             BoxShadow(
      //               color: Colors.black,
      //               blurRadius: 15,
      //               offset: Offset(10, 0),
      //             ),
      //           ],
      //         ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Icon(Icons.phone, size: 50, color: Colors.white),
      //             Text(
      //               'Phone',
      //               style: TextStyle(fontSize: 25, color: Colors.white),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
