import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/provider/auth_provider.dart';
import 'package:task_manager/provider/network_provider.dart';
import 'package:task_manager/provider/task_provider.dart';

import 'app.dart';

void main(){
  runApp(

    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthProvider()),
      ChangeNotifierProvider(create: (_)=>NetworkProvider()),
      ChangeNotifierProvider(create: (_)=>TaskProvider()),
    ],
    child:  TaskManagerApp(),
    ),
  );
}