import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/presentation/add_memory_screen/add_memory_screen.dart';
import 'package:memory/src/presentation/widgets/primary_button.dart';
import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';


class MemoryLayout extends StatefulWidget {
  const MemoryLayout({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  State<MemoryLayout> createState() => _MemoryLayoutState();
}

class _MemoryLayoutState extends State<MemoryLayout> {
  static const buttonText = "Add memory";
  static const appBarTitle = "Memory's Screen";

  static const defaultSpacer = SizedBox(height: 18);
  static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);

  @override
  void initState() {
    widget.store.dispatch(LoadingMemoryAction());
    super.initState();
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
              Flexible(child: Container()),
              Align(
                child: PrimaryButton(
                  text: buttonText,
                  onPressed: () {

                    Navigator.pushNamed(context, AddMemoryScreen.path);
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
