import 'package:flutter/material.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/presentation/widgets/primary_button.dart';

class AddMemoryLayout extends StatefulWidget {
  const AddMemoryLayout({super.key});

  @override
  State<AddMemoryLayout> createState() => _AddMemoryLayoutState();
}

class _AddMemoryLayoutState extends State<AddMemoryLayout> {
   final _titleFocusNode = FocusNode();
   final _titleController = TextEditingController();

   static const buttonText = 'Add memory';
   static const appBarTitle = 'Add memory';
   static const labelTextTitle = 'Enter memory title';

   static const topSpacer = SizedBox(height: 24);
   static const defaultSpacer = SizedBox(height: 18);
   static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _titleController.dispose();
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
            TextFormField(
              controller: _titleController,
              focusNode: _titleFocusNode,
              decoration: const InputDecoration(
                labelText: labelTextTitle,
              ),
              onChanged: (value){},
            ),
            defaultSpacer,
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                text: buttonText,
                onPressed: () {

                },
                buttonColor: TotalPalette.primaryColor,
                textButtonColor: TotalPalette.scaffoldBackgroundColor,
              ),
            ),
            defaultSpacer,
          ],
        ),
      ),
    );
  }
}
