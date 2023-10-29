import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../model/color_description.dart';

class ColorDescriptionsState {
  final List<ColorDescription> colorDescretions;

  const ColorDescriptionsState({required this.colorDescretions});

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
  final ColorDescription removeElement;
  ColorDescriptionsRemoveEvent({required this.removeElement});
}

final class ColorDescreptionsCanceledDeletingEvent
    extends ColorDescriptionEvents {
  final ColorDescription returnedElement;
  final int index;
  ColorDescreptionsCanceledDeletingEvent(
      {required this.returnedElement, required this.index});
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
          ColorDescription(
              color: Colors.amber,
              description: "Aha",
              title: "Oj",
              id: uuid.v4())
        ])) {
    on<ColorDescriptionsAddEvent>(_onAdd);
    on<ColorDescriptionsRemoveEvent>(_onRemove);
    on<ColorDescriptionsEditEvent>(_onEdit);
    on<ColorDescreptionsCanceledDeletingEvent>(_onRemovedCanceled);
  }

  void _onAdd(
      ColorDescriptionsAddEvent event, Emitter<ColorDescriptionsState> emit) {
    emit(state.copyWith(
        colorDescretions: state.colorDescretions..add(event.addingElement)));
  }

  void _onRemove(ColorDescriptionsRemoveEvent event,
      Emitter<ColorDescriptionsState> emit) {
    emit(state.copyWith(
        colorDescretions: state.colorDescretions..remove(event.removeElement)));
  }

  void _onRemovedCanceled(ColorDescreptionsCanceledDeletingEvent event,
      Emitter<ColorDescriptionsState> emit) {
    emit(state.copyWith(
        colorDescretions: state.colorDescretions
          ..insert(event.index, event.returnedElement)));
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