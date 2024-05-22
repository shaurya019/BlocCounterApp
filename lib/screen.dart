import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/bloc/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_event.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Example'),
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc,CounterState>(
              builder: (context,state){
                return Center(child: Text(state.counter.toString(),style: TextStyle(fontSize: 60),));
              }
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: Text('Increment')),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: Text('Decrement')),
            ],
          )
        ],
      )
    );
  }
}
