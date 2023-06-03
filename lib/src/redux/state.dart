import 'package:flutter/material.dart';

class AppState{
  AppState({
    required this.counter,
    required this.text,
    required this.widget,
  });

  final Widget widget;
  final int counter;
  final String text;
}

