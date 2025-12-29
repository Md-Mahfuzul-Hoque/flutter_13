import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../widgets/snack_bar.dart';
import '../widgets/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {

  List<TaskModel> _cancelledTaskList = [];
  bool _getcancelledTaskProgress = false;

  Future<void> _getAllTask() async {
    _getcancelledTaskProgress = true;
    setState(() {});

    final ApiResponse response =
    await ApiCaller.getRequest(url: Urls.cancelledTaskUrl);

    _getcancelledTaskProgress = false;
    setState(() {});
    List<TaskModel> list = [];
    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
    }else{
      showSnackBarMessage(context, response.errorMessage.toString());
    }
    _cancelledTaskList = list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllTask();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0),
        child: Visibility(
          visible: _getcancelledTaskProgress = false,
          replacement: Center(
              child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: _cancelledTaskList.length,
            itemBuilder: (context, index) {
              return TaskCard(
                taskModel: _cancelledTaskList[index],
                cardColor: Colors.red,
                refreshParent: (){
                  _getAllTask();
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
      ),
    );
  }
}
