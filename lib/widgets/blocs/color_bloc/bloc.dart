import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorAnimationState {
  final bool choosed;
  final Color? color;

  ColorAnimationState({required this.choosed, required this.color});

  ColorAnimationState copyWith({required choosed, required color}) {
    return ColorAnimationState(choosed: choosed ?? this.choosed, color: color);
  }
}

abstract class ColorAnimationEvents {}

final class ColorAnimationToggledEvent extends ColorAnimationEvents {
  final Color toogledColor;
  ColorAnimationToggledEvent({required this.toogledColor});
}

final class ColorAnimationUntoggledEvent extends ColorAnimationEvents {
  ColorAnimationUntoggledEvent();
}

class ColorAnimationBloc
    extends Bloc<ColorAnimationEvents, ColorAnimationState> {
  ColorAnimationBloc()
      : super(ColorAnimationState(choosed: false, color: null)) {
    on<ColorAnimationToggledEvent>(_onToogle);
    on<ColorAnimationUntoggledEvent>(_onUntoogle);
  }

  void _onToogle(
      ColorAnimationToggledEvent event, Emitter<ColorAnimationState> emit) {
    emit(state.copyWith(choosed: true, color: event.toogledColor));
  }

  void _onUntoogle(
      ColorAnimationUntoggledEvent event, Emitter<ColorAnimationState> emit) {
    emit(state.copyWith(choosed: false, color: null));
  }
  
}
