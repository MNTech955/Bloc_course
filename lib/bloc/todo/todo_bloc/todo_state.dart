

 import 'package:equatable/equatable.dart';

class TodoState extends Equatable {

  final List<String> toDoList;
  const TodoState({
    this.toDoList= const [],
  });

 
  TodoState copyWith({ List<String>? toDoList}){
    return TodoState(
      toDoList: toDoList ??this.toDoList
    );
  }
  
  @override
  List<Object> get props => [toDoList];
}


