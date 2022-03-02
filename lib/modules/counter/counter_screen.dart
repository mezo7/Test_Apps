import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/modules/counter/cubit/cubit.dart';
import 'package:test_app/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){
          if(state is CounterPlusState)print('Plus state ${state.counter}');
          if(state is CounterMinusState)print('Minus state ${state.counter}');
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'Minus',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      'Plus',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


