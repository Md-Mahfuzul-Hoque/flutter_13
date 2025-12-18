import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

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
    );
  }
}
