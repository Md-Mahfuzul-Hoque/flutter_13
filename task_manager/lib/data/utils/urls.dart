
class Urls{
  static String _baseUrl = 'http://35.73.30.144:2005/api/v1';

  static String registrationUrl = '$_baseUrl/registration';
  static String loginUrl = '$_baseUrl/login';
  static String createTaskUrl = '$_baseUrl/createTask';
  static String taskCountUrl = '$_baseUrl/taskStatusCount';
  static String newTaskUrl = '$_baseUrl/ListTaskByStatus/New';
  static String progressTaskUrl = '$_baseUrl/ListTaskByStatus/Progress';
  static String completedTaskUrl = '$_baseUrl/ListTaskByStatus/Completed';
  static String cancelledTaskUrl = '$_baseUrl/ListTaskByStatus/Cancelled';
  static String deleteTaskUrl(String taskId) =>  '$_baseUrl/deleteTask/$taskId';
  static String changeStatus(String taskId,String status) => '$_baseUrl/updateTaskStatus/$taskId/$status';
}