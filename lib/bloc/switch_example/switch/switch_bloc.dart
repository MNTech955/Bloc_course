

import 'package:bloc_course/bloc/switch_example/switch/switch_event.dart';
import 'package:bloc_course/bloc/switch_example/switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchStates> {
  SwitchBloc():super(SwitchStates()){
     on<EnableOrDisableNotification>(_enableOrDisableNotification);
     on<SliderEvent >(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events, Emitter<SwitchStates> emit ){
    emit(state.copyWith(isSwitch: !state.isSwitch));

  }
  //here the slider value come from events
  void _slider(SliderEvent events, Emitter<SwitchStates> emit ){
    emit(state.copyWith(slider: events.slider));

  }
}