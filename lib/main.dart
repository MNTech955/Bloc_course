import 'package:bloc_course/bloc/counter/counter_bloc.dart';
import 'package:bloc_course/bloc/image_picker/bloc/image_picker_bloc.dart';
import 'package:bloc_course/bloc/post/post_bloc/post_bloc.dart';
import 'package:bloc_course/bloc/switch_example/switch/switch_bloc.dart';
import 'package:bloc_course/bloc/todo/todo_bloc/todo_bloc.dart';
import 'package:bloc_course/ui/post_screen.dart';

import 'package:bloc_course/ui/to_do_screen.dart';
import 'package:bloc_course/ui/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //widget tree material se shru huta hai , tu ham ne material ke upar counter bloc ko add ke
          //thke widget tree mein jitne bi widget ate hai hu easily counterbloc ko access kare
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (context) => TodoBloc()
        ),
        BlocProvider(
          create: (context) => PostBloc()
        ),
      ],
      
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: PostScreen(),
        ),
      );
    
  }
}
