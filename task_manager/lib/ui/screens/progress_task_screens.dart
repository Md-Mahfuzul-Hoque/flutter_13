import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../../provider/task_provider.dart';
import '../widgets/snack_bar.dart';
import '../widgets/task_card.dart';

class ProgressTaskScreens extends StatefulWidget {
  const ProgressTaskScreens({super.key});

  @override
  State<ProgressTaskScreens> createState() => _ProgressTaskScreensState();
}

class _ProgressTaskScreensState extends State<ProgressTaskScreens> {

  // List<TaskModel> _progressTaskList = [];
  // bool _getprogressTaskProgress = false;

  // Future<void> _getAllTask() async {
  //   _getprogressTaskProgress = true;
  //   setState(() {});
  //
  //   final ApiResponse response =
  //   await ApiCaller.getRequest(url: Urls.progressTaskUrl);
  //
  //   _getprogressTaskProgress = false;
  //   setState(() {});
  //   List<TaskModel> list = [];
  //   if (response.isSuccess) {
  //     for (Map<String, dynamic> jsonData in response.responseData['data']) {
  //       list.add(TaskModel.fromJson(jsonData));
  //     }
  //   }else{
  //     showSnackBarMessage(context, response.errorMessage.toString());
  //   }
  //   _progressTaskList = list;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future <void> loadData()async {
    final taskProvider = Provider.of<TaskProvider>(context,listen: false);
    Future.wait([
      taskProvider.fetchNewTaskByStatus('Progress'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: Consumer<TaskProvider>(
          builder: (context,taskProvider,child) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0),
            child: ListView.separated(
              itemCount: taskProvider.progressTask.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskModel:taskProvider.progressTask[index],
                  cardColor: Colors.purple,
                  refreshParent: (){
                    loadData();
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 4,
                );
              },
            ),
          );
        }
      ),
    );
  }
}
