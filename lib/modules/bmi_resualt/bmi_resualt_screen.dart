import 'package:flutter/material.dart';
import 'package:test_app/modules/bmi/bmi_calc_screen.dart';

class BmiResualt extends StatelessWidget {
  final int resualt;
  final int age;
  final bool isMale;

  BmiResualt({required this.resualt, required this.age, required this.isMale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Resualt'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: (){
          Navigator.pop(context);

        },),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Gender : ${isMale?'Male':'Female'}',
          style: TextStyle(fontSize: 25.0,
          fontWeight: FontWeight.bold,

    ),
    ),
          Text('Resualt : $resualt',
          style: TextStyle(fontSize: 25.0,
          fontWeight: FontWeight.bold,

    ),
    ),
          Text('Age : $age',
          style: TextStyle(fontSize: 25.0,
          fontWeight: FontWeight.bold,

    ),
    ),

        ],
    ),
      )
    );
  }
}
