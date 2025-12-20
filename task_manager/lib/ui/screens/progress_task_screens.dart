import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

import '../widgets/task_card.dart';

class ProgressTaskScreens extends StatefulWidget {
  const ProgressTaskScreens({super.key});

  @override
  State<ProgressTaskScreens> createState() => _ProgressTaskScreensState();
}

class _ProgressTaskScreensState extends State<ProgressTaskScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0),
        child: ListView.separated(

            itemBuilder: (context, index){
              return TaskCard(status: 'Progressed', cardColor: Colors.purple,);
            },
            separatorBuilder: (context, index){
              return SizedBox(
                height: 2,
              );
            },
            itemCount: 10),
      ),
    );
  }
}
