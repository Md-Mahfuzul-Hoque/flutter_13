import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../widgets/snack_bar.dart';
import '../widgets/task_card.dart';

class ProgressTaskScreens extends StatefulWidget {
  const ProgressTaskScreens({super.key});

  @override
  State<ProgressTaskScreens> createState() => _ProgressTaskScreensState();
}

class _ProgressTaskScreensState extends State<ProgressTaskScreens> {

  List<TaskModel> _progressTaskList = [];
  bool _getprogressTaskProgress = false;

  Future<void> _getAllTask() async {
    _getprogressTaskProgress = true;
    setState(() {});

    final ApiResponse response =
    await ApiCaller.getRequest(url: Urls.progressTaskUrl);

    _getprogressTaskProgress = false;
    setState(() {});
    List<TaskModel> list = [];
    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
    }else{
      showSnackBarMessage(context, response.errorMessage.toString());
    }
    _progressTaskList = list;
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
          visible: _getprogressTaskProgress == false,
          replacement: Center(
              child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: _progressTaskList.length,
            itemBuilder: (context, index) {
              return TaskCard(
                taskModel: _progressTaskList[index],
                cardColor: Colors.purple,
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
