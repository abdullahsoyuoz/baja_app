import 'package:baja_app/Utility/Colors.dart';
import 'package:flutter/material.dart';

class BajaBoxDecorations{
  static final moodDecoration = BoxDecoration(
      color: BajaAppColors.orange,
      borderRadius: BorderRadius.all(Radius.circular(1000)));

  static final productItemDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4)
      ]);
}