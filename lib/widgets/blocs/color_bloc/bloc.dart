import 'package:flutter_bloc/flutter_bloc.dart';

class ColorAnimationState {
  final bool choosed;

  ColorAnimationState({required this.choosed});

  ColorAnimationState copyWith({required choosed}) {
    return ColorAnimationState(choosed: choosed ?? this.choosed);
  }
}

abstract class ColorAnimationEvents {}

final class ColorAnimationToggledEvent extends ColorAnimationEvents {
  ColorAnimationToggledEvent();
}

final class ColorAnimationUntoggledEvent extends ColorAnimationEvents {
  ColorAnimationUntoggledEvent();
}

class ColorAnimationBloc
    extends Bloc<ColorAnimationEvents, ColorAnimationState> {
  ColorAnimationBloc() : super(ColorAnimationState(choosed: false)) {
    on<ColorAnimationToggledEvent>(_onToogle);
    on<ColorAnimationUntoggledEvent>(_onUntoogle);
  }

  void _onToogle(
      ColorAnimationToggledEvent event, Emitter<ColorAnimationState> emit) {
    emit(state.copyWith(choosed: true));
  }

  void _onUntoogle(
      ColorAnimationUntoggledEvent event, Emitter<ColorAnimationState> emit) {
    emit(state.copyWith(choosed: false));
  }
}
