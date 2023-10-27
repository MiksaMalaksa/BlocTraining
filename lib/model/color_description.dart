import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ColorDescription {
  String? description;
  String? title;
  Color? color;
  String id;

  ColorDescription(
      {required this.color, required this.description, required this.title})
      : id = uuid.v4();
}
