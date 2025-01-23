import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
 // final bool isSwitchOn;
  const CounterState({
    this.counter = 0,
    //this.isSwitchOn = false
  });

  //copywith hamre class ka new instance create karta hai ju hamra help karta hai tu override counter value
  CounterState copyWith({ int? counter  }) {
    return CounterState(
      counter: counter ?? this.counter,
      //isSwitchOn : isSwitchOn ?? this.isSwitchOn,
    );
  }

  @override
  List<Object> get props => [ counter];
}