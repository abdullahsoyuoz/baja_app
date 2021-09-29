import 'package:baja_app/Utility/util.dart';
import 'package:flutter/material.dart';

double ratio = 380;

EdgeInsetsGeometry overallBodyOnlyTopPadding(BuildContext context){
  return EdgeInsets.only(top: getWidth(context) * 100 / ratio);
}

EdgeInsetsGeometry overallBodySymmetricPadding(BuildContext context){
  return EdgeInsets.symmetric(
    vertical: getWidth(context) * 100 / ratio,
    horizontal: getWidth(context) * 15 / ratio,
  );
}

EdgeInsetsGeometry leftEdge(BuildContext context, double size){
  return EdgeInsets.only(left: getWidth(context) * size / ratio);
}

EdgeInsetsGeometry rightEdge(BuildContext context, double size){
  return EdgeInsets.only(right: getWidth(context) * size / ratio);
}

EdgeInsetsGeometry topEdge(BuildContext context, double size){
  return EdgeInsets.only(top: getWidth(context) * size / ratio);
}

EdgeInsetsGeometry bottomEdge(BuildContext context, double size){
  return EdgeInsets.only(bottom: getWidth(context) * size / ratio);
}

EdgeInsetsGeometry symVerticalEdge(BuildContext context, double size){
  return EdgeInsets.symmetric(vertical: getWidth(context) * size / ratio);
}

EdgeInsetsGeometry symHorizontalEdge(BuildContext context, double size){
  return EdgeInsets.symmetric(horizontal: getWidth(context) * size / ratio);
}

EdgeInsetsGeometry allEdge(BuildContext context, double size){
  return EdgeInsets.all(getWidth(context) * size / ratio);
}
