
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:test_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:test_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:test_app/shared/components/components.dart';
import 'package:test_app/shared/components/constants.dart';
import 'package:test_app/shared/cubit/cubit.dart';
import 'package:test_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {


  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  bool isButtomSheetShown = false;
  IconData fabicon = Icons.edit;
  var titleControlar = TextEditingController();
  var dateControlar = TextEditingController();
  var timeControlar = TextEditingController();
  var statusControlar = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: cubit.tittels[cubit.currentindex],
            ),
            body: ConditionalBuilder(
              condition: true,
              builder: (context)=>cubit.screens[cubit.currentindex],
              fallback: (context)=>Center(child: CircularProgressIndicator()),

            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (isButtomSheetShown) {
                  if (formkey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      title: titleControlar.text,
                      date: dateControlar.text,
                      time: timeControlar.text,
                    ).then((value){
                      cubit.getDataFromDatabase(cubit.database).then((value){
                        Navigator.pop(context);
                        // setState(() {
                        //   isButtomSheetShown = false;
                        //   fabicon= Icons.edit;
                        //   tasks = value;
                        // });
                        tasks = value;
                      });

                    } );
                  }
                } else {
                  scaffoldkey.currentState!.showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defualtTextFormField(
                                controller: titleControlar,
                                type: TextInputType.text,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Title must not be empty';
                                  }
                                },
                                label: "Task Title",
                                prefixIcon: Icons.title_outlined,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defualtTextFormField(
                                controller: dateControlar,
                                type: TextInputType.datetime,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Date must not be empty';
                                  }
                                },
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-12-31'),
                                  ).then((value) {
                                    dateControlar.text =
                                        DateFormat.yMd().format(value!);
                                  });
                                },
                                label: "Task Date",
                                prefixIcon: Icons.calendar_today_outlined,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defualtTextFormField(
                                controller: timeControlar,
                                type: TextInputType.datetime,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeControlar.text = value!.format(context);
                                  });
                                },
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Time must not be empty';
                                  }
                                },
                                label: "Task Time",
                                prefixIcon: Icons.access_time_rounded,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value) {

                    isButtomSheetShown = false;
                    // setState(() {
                    //   fabicon = Icons.edit;
                    // });
                  });
                  isButtomSheetShown = true;
                  // setState(() {
                  //   fabicon = Icons.add;
                  // });
                }
              },
              child: Icon(fabicon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeIndex(index);

              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.view_headline_outlined),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archive',
                )
              ],
            ),
          );
        }


      ),
    );
  }



}

