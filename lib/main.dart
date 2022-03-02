
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:test_app/layout/home_layout.dart';
import 'package:test_app/modules/bmi/bmi_calc_screen.dart';
import 'package:test_app/modules/bmi_resualt/bmi_resualt_screen.dart';
import 'package:test_app/modules/counter/counter_screen.dart';
import 'package:test_app/modules/home/home_screen.dart';
import 'package:test_app/modules/login/login_screen.dart';
import 'package:test_app/modules/messenger/messenger_screen.dart';
import 'package:test_app/modules/users/users_screen.dart';

import 'shared/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
