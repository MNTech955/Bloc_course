import 'package:bloc_course/bloc/switch_example/switch/switch_bloc.dart';
import 'package:bloc_course/bloc/switch_example/switch/switch_event.dart';
import 'package:bloc_course/bloc/switch_example/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Example Two"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification"),
               
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) =>previous.isSwitch!=current.isSwitch,
                    builder: (context, state) {
                      print("notifcation");
                  return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        context
                            .read<SwitchBloc>()
                            .add(EnableOrDisableNotification());
                      });
                }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            }),
            SizedBox(
              height: 50,
            ),
           
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) => previous.slider!=current.slider,
              builder: (context, state) {
              
              print("Slider");
              return Slider(value: state.slider, onChanged: (value) {
                context.read<SwitchBloc>().add(SliderEvent(slider: value));

              });
            }),
          ],
        ),
      ),
    );
  }
}
