import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../model/color_description.dart';

class ColorDescriptionsState extends Equatable {
  final List<ColorDescription> colorDescretions;

  const ColorDescriptionsState({required this.colorDescretions});

  @override
  List<Object?> get props => [];

  ColorDescriptionsState copyWith({required colorDescretions}) {
    return ColorDescriptionsState(
        colorDescretions: colorDescretions ?? this.colorDescretions);
  }
}

abstract class ColorDescriptionEvents {
  ColorDescriptionEvents();
}

final class ColorDescriptionsAddEvent extends ColorDescriptionEvents {
  final ColorDescription addingElement;
  ColorDescriptionsAddEvent({required this.addingElement});
}

final class ColorDescriptionsRemoveEvent extends ColorDescriptionEvents {
  final List<ColorDescription> colorDescretions;
  final ColorDescription removeElement;
  ColorDescriptionsRemoveEvent(
      {required this.colorDescretions, required this.removeElement});
}

final class ColorDescriptionsEditEvent extends ColorDescriptionEvents {
  final List<ColorDescription> colorDescretions;
  final ColorDescription editElement;
  ColorDescriptionsEditEvent(
      {required this.colorDescretions, required this.editElement});
}

class ColorDescriptionsBloc
    extends Bloc<ColorDescriptionEvents, ColorDescriptionsState> {
  ColorDescriptionsBloc()
      : super(ColorDescriptionsState(colorDescretions: [
          ColorDescription(color: Colors.amber, description: "Aha", title: "Oj")
        ])) {
    on<ColorDescriptionsAddEvent>(_onAdd);
    on<ColorDescriptionsRemoveEvent>(_onRemove);
    on<ColorDescriptionsEditEvent>(_onEdit);
  }

  void _onAdd(
      ColorDescriptionsAddEvent event, Emitter<ColorDescriptionsState> emit) {
    emit(state.copyWith(
        colorDescretions:  state.colorDescretions..add(event.addingElement)));
  }


  void _onRemove(ColorDescriptionsRemoveEvent event,
      Emitter<ColorDescriptionsState> emit) {
    emit(state.copyWith(
        colorDescretions: state.colorDescretions..remove(event.removeElement)));
  }

  void _onEdit(
      ColorDescriptionsEditEvent event, Emitter<ColorDescriptionsState> emit) {
    final indexOfElementBeforeEfiting = state.colorDescretions
        .indexWhere((element) => element.id == event.editElement.id);

    emit(state.copyWith(
        colorDescretions: state.colorDescretions[indexOfElementBeforeEfiting]));
  }
}


// void _onEdit(ColorDescreptionsEditEvent event, Emitter<ColorDescriptionsState> emit) {
//     final indexOfElementBeforeEditing = state.colorDescretions.indexWhere((element) => element.id == event.editElement.id);
    
//     emit(state.copyWith(
//         colorDescretions: [
//             ...state.colorDescretions.sublist(0, indexOfElementBeforeEditing),
//             event.editElement,
//             ...state.colorDescretions.sublist(indexOfElementBeforeEditing + 1),
//         ],
//     ));
// }