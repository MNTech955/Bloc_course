



import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable {
  
  bool isSwitch;
  double slider;
  //ham ne class ka instance create kia and by default false value pass ki
  SwitchStates({
    this.isSwitch=false,
    this.slider=1.0, 
  });

  //copy with method hamre class ka new instance create karta hai 

 SwitchStates copyWith({bool? isSwitch, double? slider}){
  return SwitchStates(
    isSwitch: isSwitch?? this.isSwitch,
    slider: slider?? this.slider,

    );
 }
  
  @override
  List<Object> get props => [isSwitch, slider];
}


