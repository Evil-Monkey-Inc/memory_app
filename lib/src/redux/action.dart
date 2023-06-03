import 'package:flutter/cupertino.dart';

abstract class Actions{}

class AddAction extends Actions{}

class SetTextAction extends Actions{
  SetTextAction({required this.text});

  final String text;
}

class LoadingMemoryAction extends Actions{}

class SuccessLoadedMemoryAction extends Actions{
  SuccessLoadedMemoryAction(this.widget);

  final Widget widget;
}