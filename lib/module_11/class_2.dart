import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResPKG extends StatelessWidget {
  const ResPKG({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(

      appBar: AppBar(
        title: Text('ResPkg',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: orientation == Orientation.landscape ?
          Axis.horizontal : Axis.vertical,
          child: orientation == Orientation.landscape ?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //width 200.r == min(200.w,200.h
                width: 200.r,
                height: 100.r,
                color: Colors.green,

              ),
              Row(
                children: [
                  Container(
                    width: 0.3.sw,
                    height: 200.h,
                    color: Colors.blue,
                    child: Text(''
                        'My Actual Width ${0.5.sw}'
                        'My Actual height${200.h}'
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 250,
                      maxWidth: 200,
                    ).hw,
                    color: Colors.purple,
                    child: Text('Hello'),
                  ),
                ],
              ),
              Container(
                height: 150.h,
                width: 150.w,
                color: Colors.teal,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
              Text('Hello Test res',
                style: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.teal
                ),
              ),
              Text('Hello Test',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.red
                ),
              ),
            ],
          ) :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //width 200.r == min(200.w,200.h
                width: 200.r,
                height: 100.r,
                color: Colors.grey,
                
              ),
              Row(
               children: [
                 Container(
                   width: 0.3.sw,
                   height: 200.h,
                   color: Colors.blue,
                   child: Text(''
                       'My Actual Width ${0.5.sw}'
                       'My Actual height${200.h}'
                   ),
                 ),
                 Container(
                   constraints: BoxConstraints(
                     maxHeight: 250,
                     maxWidth: 200,
                   ).hw,
                   color: Colors.purple,
                   child: Text('Hello'),
                 ),
               ],
              ),
              Container(
                height: 150.h,
                width: 150.w,
                color: Colors.teal,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
              Text('Hello Test res',
              style: TextStyle(
                fontSize: 25.sp,
                color: Colors.teal
              ),
              ),
              Text('Hello Test',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
