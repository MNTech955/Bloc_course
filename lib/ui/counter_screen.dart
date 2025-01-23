

import 'package:bloc_course/bloc/counter/counter_bloc.dart';
import 'package:bloc_course/bloc/counter/counter_event.dart';
import 'package:bloc_course/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print("Buld");
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Counter Example"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //blocBuilder ka code run huta hai hu counterBloc mein jata hai,CounterState mein jata hai and counter 
          //ki value pick karta hai, BlocBuilder tab build huta hai jab koi event trigger huta hai , and usko aik new state 
          //return uti hai 
         BlocBuilder<CounterBloc, CounterState>(
          
          builder: (context, state){
            return  Center(child: Text(state.counter.toString(), style: TextStyle(fontSize: 60),));
           
          }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: Text("Incriment")),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: Text("Deccriment")),
            ],
          )


        ],
      ),
    );
  }
}