import 'package:flutter/material.dart';

double getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

Widget h10Sized(BuildContext context){
  return  SizedBox(height: getWidth(context) * 10 / 380);
}

Widget w10Sized(BuildContext context){
  return  SizedBox(width: getWidth(context) * 10 / 380);
}