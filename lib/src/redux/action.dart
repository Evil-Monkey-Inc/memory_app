abstract class Actions{}

class AddAction extends Actions{}

class SetTextAction extends Actions{
  SetTextAction({required this.text});

  final String text;
}