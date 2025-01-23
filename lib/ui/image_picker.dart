import 'dart:io';

import 'package:bloc_course/bloc/image_picker/bloc/image_picker_bloc.dart';
import 'package:bloc_course/bloc/image_picker/bloc/image_picker_event.dart';
import 'package:bloc_course/bloc/image_picker/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker Bloc"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state){
            if(state.file==null){
              return InkWell(
                onTap: (){
                  context.read<ImagePickerBloc>().add(GalleryImagePicker());
                },
                child: CircleAvatar(
                  child: Icon(Icons.camera),
                ),
              );
            }else{
              //File(state.file!.path.toString())-->Creates a File object using the file path.
              //A File object in Dart represents a file on the device's file system
              //Image.file()-->A Flutter widget that displays an image stored in the device's file system.
              //It accepts a File object as an argument.
             return Image.file(File(state.file!.path.toString()));
            }
          }
          ),
      ),
    );
  }
}