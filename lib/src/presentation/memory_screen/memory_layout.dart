import 'package:flutter/material.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/presentation/widgets/primary_button.dart';

class MemoryLayout extends StatefulWidget {
  const MemoryLayout({Key? key}) : super(key: key);

  @override
  State<MemoryLayout> createState() => _MemoryLayoutState();
}

class _MemoryLayoutState extends State<MemoryLayout> {

  static const buttonText = 'Add memory';
  static const appBarTitle = 'Memory Screen';

  static const topSpacer = SizedBox(height: 20.0);
  static const defaultSpacer = SizedBox(height: 18);
  static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: screenPadding,
        child: Column(
          children: [
            Expanded(child: Container()),
            Align(
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
