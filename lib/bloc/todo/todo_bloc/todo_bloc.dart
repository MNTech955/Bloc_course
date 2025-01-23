import 'package:bloc/bloc.dart';
import 'package:bloc_course/bloc/todo/todo_bloc/todo_event.dart';
import 'package:bloc_course/bloc/todo/todo_bloc/todo_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> toDoList=[];
  TodoBloc() : super(TodoState()) {
    on<AddToDoEvent>(_addTodoEvent);
    on<RemoveToDoEvent>(_removeTodoEvent);

  
  }
  void _addTodoEvent(AddToDoEvent event, Emitter<TodoState> emit){
    toDoList.add(event.task);
    emit(state.copyWith(toDoList: List.from(toDoList)));

     
  }
  void _removeTodoEvent(RemoveToDoEvent event, Emitter<TodoState> emit){
    toDoList.remove(event.task);
    emit(state.copyWith(toDoList: List.from(toDoList)));

     
  }
}
