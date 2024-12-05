import 'package:my_do/db_helper/repository.dart';
import 'package:my_do/models/task.dart';

class TaskService {
  late Repository _repository;
  TaskService() {
    _repository = Repository();
  }

  //Save
  saveTask(Task task) async {
    return await _repository.insertData('task', task.toMap());
  }

  //Read All
  readAllTask() async {
    return await _repository.readDataAll('task');
  }

  //read unDone tasks
  Future<List<Task>> getUnDoneTasks() async {
    var tasks = await _repository.readData('task', 'doneDateFa IS NULL', 'type');
    List<Task> tasksList = tasks.isNotEmpty ? List<Task>.from(tasks.map((c) => Task.fromMap(c)).toList()) : [];
    return tasksList;
  }

//read where tasks
  Future<List<Task>> getTasksWhere(String where, String order) async {
    var tasks = await _repository.readData('task', where, order);
    List<Task> tasksList = tasks.isNotEmpty ? List<Task>.from(tasks.map((c) => Task.fromMap(c)).toList()) : [];
    return tasksList;
  }

  //Edit
  updateTask(Task task) async {
    return await _repository.updateData('task', task.toMapUpdate());
  }

  deleteTasks() async {
    return await _repository.deleteAllRecords('task', '');
  }

  // deleteUser(personId) async {
  //   return await _repository.deleteDataById('userInfo', personId);
  // }

  // resetNobatToId(loanNumber) async {
  //   return await _repository.resetNobatToId('userInfo', loanNumber);
  // }

  // addCol() async {
  //   return await _repository.alterTable('persons', 'amount');
  // }
}
