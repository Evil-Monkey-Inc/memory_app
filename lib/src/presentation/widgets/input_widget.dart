import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.labelText,
    this.maxLines,
    this.onChanged,
    this.titleController,
  });

  final String labelText;
  final int? maxLines;
  final Function(String)? onChanged;
  final TextEditingController? titleController;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _titleFocusNode = FocusNode();

  @override
  void dispose() {
    _titleFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.titleController,
      focusNode: _titleFocusNode,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        labelText: widget.labelText,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
