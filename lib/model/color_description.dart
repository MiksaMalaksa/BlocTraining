import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

//alt - левая кнопка
class ColorDescription extends Equatable {
  final String? description;
  final String? title;
  final Color? color;
  final String id;

  const ColorDescription(
      {required this.color,
      required this.description,
      required this.title,
      required this.id});

  @override
  List<Object?> get props => [id];
}
