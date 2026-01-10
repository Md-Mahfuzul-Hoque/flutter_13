import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/ui/widgets/task_card.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../../provider/task_provider.dart';
import '../widgets/snack_bar.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {

  // List<TaskModel> _completedTaskList = [];
  // bool _isloading = false;

  // Future<void> _getAllTask() async {
  //   _isloading = true;
  //   setState(() {});
  //
  //   final ApiResponse response =
  //   await ApiCaller.getRequest(url: Urls.completedTaskUrl);
  //
  //   _isloading = false;
  //   setState(() {});
  //   List<TaskModel> list = [];
  //   if (response.isSuccess) {
  //     for (Map<String, dynamic> jsonData in response.responseData['data']) {
  //       list.add(TaskModel.fromJson(jsonData));
  //     }
  //   }else{
  //     showSnackBarMessage(context, response.errorMessage.toString());
  //   }
  //   _completedTaskList = list;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  Future <void> loadData()async {
    final taskProvider = Provider.of<TaskProvider>(context,listen: false);
    Future.wait([
      taskProvider.fetchNewTaskByStatus('Completed'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: Consumer<TaskProvider>(
          builder: (context,taskProvider,child)  {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0),
            child: ListView.separated(
              itemCount: taskProvider.completedTask.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskModel: taskProvider.completedTask[index],
                  cardColor: Colors.green,
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
