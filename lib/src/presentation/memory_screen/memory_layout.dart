import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/presentation/add_memory_screen/add_memory_screen.dart';
import 'package:memory/src/presentation/widgets/primary_button.dart';
import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/redusers.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';


class MemoryLayout extends StatefulWidget {
  const MemoryLayout({Key? key}) : super(key: key);

  @override
  State<MemoryLayout> createState() => _MemoryLayoutState();
}

class _MemoryLayoutState extends State<MemoryLayout> {
  var counter = 0;
  var inputText = '';

  static const buttonText = "Add memory";
  static const appBarTitle = "Memory's Screen";

  static const defaultSpacer = SizedBox(height: 18);
  static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: screenPadding,
          child: Column(
            children: [
              SizedBox(height: 40,),
              StoreConnector<AppState, AppState>(
              converter: (store)=> store.state,
               builder: (context, vm) => Text(vm.toString())),
              SizedBox(height: 40,),
              TextField(
                decoration: InputDecoration(labelText: 'text'),
                onChanged: (value)=> inputText = value,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store)=> store.state,
              builder: (context, state) {
                return Text(
                  state.text,
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
              Align(
                child: PrimaryButton(
                  text: buttonText,
                  onPressed: () {
                    store.dispatch(SetTextAction(text: inputText));
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
