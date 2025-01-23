

import 'package:bloc/bloc.dart';
import 'package:bloc_course/bloc/counter/counter_event.dart';
import 'package:bloc_course/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //here we telling to bloc what will be the initial state 
  CounterBloc():super(CounterState()){
     on<IncrementCounter>(_incriment);
    
    on<DecrementCounter>(_decriment);
  }

  void _incriment(IncrementCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter+1));
  }
  void _decriment(DecrementCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter-1));
  }
}