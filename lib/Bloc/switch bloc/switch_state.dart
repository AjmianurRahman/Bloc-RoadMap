

import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{

  bool isSwitch;
  double slider;

  SwitchState({
    this.isSwitch= false,
    this.slider= 0.5
  });

 SwitchState copyWith({bool? isSwitch, double? slider}){
    return SwitchState(
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider
    );
 }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch, slider];

}