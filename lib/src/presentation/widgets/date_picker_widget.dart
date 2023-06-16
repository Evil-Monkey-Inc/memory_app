import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    required this.datePickerTitle,
    required this.dateController,
  });

  final String datePickerTitle;
  final TextEditingController dateController;

  @override
  DatePickerWidgetState createState() => DatePickerWidgetState();
}

class DatePickerWidgetState extends State<DatePickerWidget> {
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
        focusColor: TotalPalette.primaryColor,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TotalPalette.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TotalPalette.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TotalPalette.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TotalPalette.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(

          borderSide: BorderSide(color: TotalPalette.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: widget.datePickerTitle,
        suffixIcon: GestureDetector(
          onTap: _selectDate,
          child: const Icon(Icons.calendar_today),
        ),
      ),
      readOnly: true,
    );
  }
}
