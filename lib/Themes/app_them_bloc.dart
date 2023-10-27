import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeBlocState extends Equatable {
  final ThemeMode theme;

  const ThemeBlocState({required this.theme});

  @override
  List<Object?> get props => [theme];

  ThemeBlocState copyWith({required theme}) {
    return ThemeBlocState(theme: theme ?? this.theme);
  }
}

abstract class ThemeEvents {
  ThemeEvents();
}

final class DarkThemeEvent extends ThemeEvents {
  DarkThemeEvent();
}

final class LightThemeEvent extends ThemeEvents {
  LightThemeEvent();
}

class ThemeBloc extends Bloc<ThemeEvents, ThemeBlocState> {
  ThemeBloc() : super(const ThemeBlocState(theme: ThemeMode.light)) {
    on<DarkThemeEvent>(
        (event, emit) => emit(state.copyWith(theme: ThemeMode.dark)));
    on<LightThemeEvent>(
        (event, emit) => emit(state.copyWith(theme: ThemeMode.light)));
  }
}
