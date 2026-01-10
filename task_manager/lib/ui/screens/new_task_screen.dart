import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/provider/task_provider.dart';
import 'package:task_manager/ui/widgets/snack_bar.dart';

import '../../data/models/task_status_count_model.dart';
import '../../data/utils/urls.dart';
import '../widgets/task_card.dart';
import '../widgets/task_count_by_status.dart';
import '../widgets/tm_app_bar.dart';
import 'add_new_task_screen.dart';
import '';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  // bool _getNewTaskProgress = false;
  //
  // List<TaskModel> _newTaskList = [];

  Future <void> loadData()async {
    final taskProvider = Provider.of<TaskProvider>(context,listen: false);
    Future.wait([
    taskProvider.fetchTaskStatusCount(),
    taskProvider.fetchNewTaskByStatus('New'),
    ]);
  }

  // Future<void> _getAllNewTask() async {
  //   _getNewTaskProgress = true;
  //   setState(() {});
  //
  //   final ApiResponse response =
  //       await ApiCaller.getRequest(url: Urls.newTaskUrl);
  //
  //   _getNewTaskProgress = false;
  //   setState(() {});
  //   List<TaskModel> list = [];
  //   if (response.isSuccess) {
  //     for (Map<String, dynamic> jsonData in response.responseData['data']) {
  //       list.add(TaskModel.fromJson(jsonData));
  //     }
  //   }else{
  //     showSnackBarMessage(context, response.errorMessage.toString());
  //   }
  //   _newTaskList = list;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: TMAppBar(),
      body: Consumer<TaskProvider>(
        builder: (context,taskProvider,child) {
          return Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: SizedBox(
                  height: 90,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount:taskProvider.taskStatusCount.length,
                    itemBuilder: (context, index) {
                      final counts = taskProvider.taskStatusCount;

                      return TaskCountByStatus(
                        title: counts[index].status,
                        count: counts[index].count,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 4,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: taskProvider.newTask.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      taskModel: taskProvider.newTask[index],
                      cardColor: Colors.blue,
                      refreshParent: () async {
                        await loadData();
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 4,
                    );
                  },
                ),
              ),
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  AddNewTaskScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


//Advanced Task Manager with GetX State Management