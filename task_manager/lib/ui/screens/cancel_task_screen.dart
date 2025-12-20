import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

import '../widgets/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0),
        child: ListView.separated(

            itemBuilder: (context, index){
              return TaskCard(status: 'Cancelled', cardColor: Colors.red,);
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
