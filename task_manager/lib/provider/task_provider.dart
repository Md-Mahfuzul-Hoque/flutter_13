import 'package:flutter/material.dart';
import 'package:task_manager/core/enums/api_state.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/models/task_status_count_model.dart';

import '../data/services/api_caller.dart';
import '../data/utils/urls.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _newtasks =[];
  List<TaskModel> _progressTask =[];
  List<TaskModel> _completedTask =[];
  List<TaskModel> _cancelledTask =[];

  List<TaskStatusCountModel> _taskStatusCount =[];

  ApiState _taskListState = ApiState.initial;
  ApiState _taskCountState = ApiState.initial;

  String ? _errorMessage;

  List<TaskModel> get newTask => _newtasks;
  List<TaskModel> get progressTask => _progressTask;
  List<TaskModel> get completedTask => _completedTask;
  List<TaskModel> get cancelledTask => _cancelledTask;

  List<TaskStatusCountModel> get taskStatusCount => _taskStatusCount;

  Future<void> fetchTaskStatusCount() async{
    _taskCountState = ApiState.loading;
    notifyListeners();

    final ApiResponse response =
    await ApiCaller.getRequest(url: Urls.taskCountUrl);

    if(response.isSuccess){
      _taskStatusCount = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        _taskStatusCount.add(TaskStatusCountModel.formJson(jsonData));
      }
      _taskCountState = ApiState.success;
      _errorMessage = null;
    }else{
      _taskCountState = ApiState.error;
      _errorMessage = response.errorMessage ?? 'Failed to fetch task count';
    }
    notifyListeners();

  }

  Future<void> fetchNewTaskByStatus(String status) async{
    _taskListState = ApiState.loading;
    notifyListeners();

    String url;
    switch(status){
      case ('New'):
        url = Urls.newTaskUrl;
        break;

      case 'Progress':
        url =  Urls.progressTaskUrl;
        break;

      case 'Completed':
        url = Urls.completedTaskUrl;
        break;

      case 'Cancelled':
        url = Urls.cancelledTaskUrl;
        break;

      default:
       url = Urls.newTaskUrl;

    }

    final ApiResponse response =
    await ApiCaller.getRequest(url:  url);

    if(response.isSuccess){
      List<TaskModel> tasks = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        tasks.add(TaskModel.fromJson(jsonData));
      }
      switch(status){
        case ('New'):
          _newtasks = tasks;
          break;

        case 'Progress':
          _progressTask = tasks;
          break;

        case 'Completed':
          _completedTask = tasks;
          break;

        case 'Cancelled':
          _cancelledTask = tasks;
          break;

        default:
          _newtasks = tasks;

      }



      _taskListState = ApiState.success;
      _errorMessage = null;
    }else{
      _taskCountState = ApiState.error;
      _errorMessage = response.errorMessage ?? 'Failed to fetch task';
    }
    notifyListeners();

  }

}