
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

//jab  ham CounterEvent ko bloc ko pass karte tu counterEvent ko jitne bi class ne 
//extend kia huga hu hame excess hujaenge
class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

//class SwitchEvent extends CounterEvent {}