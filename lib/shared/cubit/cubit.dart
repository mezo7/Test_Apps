import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:test_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:test_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:test_app/shared/components/constants.dart';
import 'package:test_app/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  late Database database;
  int currentindex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];
  List<Widget> tittels = [
    Text('New Tasks'),
    Text('Done Tasks'),
    Text('Archive Tasks'),
  ];
  void changeIndex(int index){
    currentindex=index;
    emit(AppChangeBottomVavBarState());
  }
  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, virsion) {
        print('database created');
        database
            .execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print('tabel created');
        }).catchError((error) {
          print('Error When Created Table : ${error}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database).then((value){
          // setState(() {
          //   tasks = value;
          // });
          tasks = value;
        });
        print('database opened');
      },
    );
  }

  Future insertToDatabase(
      {
        required String title,
        required String date ,
        required String time}
      ) async{
    await database.transaction((txn){
      return txn.rawInsert(
          'INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","new")').then((value) {
        print('inserted successfuly');

      });
    });
  }
  Future<List<Map>> getDataFromDatabase (database) async{
    return await database.rawQuery('SELECT * FROM tasks');

  }

}