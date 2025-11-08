import 'package:flutter/material.dart';
import 'package:flutter_13/module_12/example.dart';

class LifeCycle extends StatefulWidget {
   LifeCycle({super.key}){
     print('1 Constructor');
   }

  @override
  State<LifeCycle> createState(){
     print('2 create state');
     return _LifeCycleState();
  }
}

class _LifeCycleState extends State<LifeCycle> {
  String name = 'Demo';
  Color bgColor = Colors.teal;
  @override
  void initState() {
    // TODO: implement initState
    print('3 init state');
    bgColor = Colors.green;
    name = 'Mahfuz';
    super.initState();
  }
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('4 did Change Dependencies');
    bgColor = Colors.purple;
    name = 'Mahtab';
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print('5 deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('6 dispose');
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Cycle',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Example()));
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: bgColor,
                ),
                child: Center(
                  child: Text('Hello This Is $name',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
