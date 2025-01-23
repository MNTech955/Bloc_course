

import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddToDoEvent extends TodoEvent{
  final String task;
  const AddToDoEvent({required this.task});

   @override
  List<Object> get props => [task];

}

class RemoveToDoEvent extends TodoEvent{
  final Object task;
  const RemoveToDoEvent({required this.task});
   @override
  List<Object> get props => [task];
}
