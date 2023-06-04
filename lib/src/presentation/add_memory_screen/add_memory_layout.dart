import 'package:flutter/material.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/presentation/widgets/date_picker_widget.dart';
import 'package:memory/src/presentation/widgets/primary_button.dart';
import 'package:memory/src/presentation/widgets/input_widget.dart';

class AddMemoryLayout extends StatefulWidget {
  const AddMemoryLayout({super.key});

  @override
  State<AddMemoryLayout> createState() => _AddMemoryLayoutState();
}

class _AddMemoryLayoutState extends State<AddMemoryLayout> {
  static const appBarTitle = 'Add memory';
  static const buttonText = 'Remember moment ❤️';
  static const labelTextTitle = 'Enter memory title';
  static const datePickerTitle = 'Enter memory date';
  static const labelTextDescription = 'Enter memory description';

  static const maxLines = 5;

  static const topSpacer = SizedBox(height: 24);
  static const defaultSpacer = SizedBox(height: 18);
  static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);
  final datePickerController = TextEditingController();
  final titleController = TextEditingController();

  bool get isBUttonEbaled {
    if (!mounted) return false;
    return datePickerController.text.isNotEmpty && titleController.text.isNotEmpty;
  }

  @override
  void initState() {
    datePickerController.addListener(() => setState(() {}));
    titleController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    datePickerController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: screenPadding,
        child: Column(
          children: [
            topSpacer,
            InputWidget(
              labelText: labelTextTitle,
              titleController: titleController,
            ),
            defaultSpacer,
            DatePickerWidget(
              datePickerTitle: datePickerTitle,
              dateController: datePickerController,
            ),
            defaultSpacer,
            InputWidget(
              labelText: labelTextDescription,
              maxLines: maxLines,
              onChanged: (value) {
                print(value);
              },
            ),
            const Spacer(),
            PrimaryButton(
              isEnabled: isBUttonEbaled,
              text: buttonText,
              onPressed: () {},
              buttonColor: TotalPalette.primaryColor,
              textButtonColor: TotalPalette.scaffoldBackgroundColor,
            ),
            defaultSpacer,
          ],
        ),
      ),
    );
  }
}
