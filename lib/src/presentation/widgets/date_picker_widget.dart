import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key, required this.datePickerTitle, required this.dateController});

  final String datePickerTitle;
  final TextEditingController dateController;



  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {

  Future<void> _selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendar,
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      setState(() {
        widget.dateController.text = formattedDate.toString();

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: widget.datePickerTitle,
        suffixIcon: GestureDetector(
          onTap: _selectDate,
          child: Icon(Icons.calendar_today),
        ),
      ),
      readOnly: true,
    );
  }
}
