import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/presentation/add_memory_screen/add_memory_screen.dart';
import 'package:memory/src/presentation/widgets/primary_button.dart';
import 'package:memory/src/redux/action.dart';
import 'package:memory/src/redux/state.dart';
import 'package:redux/redux.dart';

class MemoryLayout extends StatelessWidget {
  static const buttonText = "Add memory";
  static const appBarTitle = "Memory's Screen";

  static const defaultSpacer = SizedBox(height: 18);
  static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);

  const MemoryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      onInit:(store) => store.dispatch(LoadingHomeAction()),
        builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(appBarTitle),
            centerTitle: true,
          ),
          body: Padding(
            padding: screenPadding,
            child: Column(
              children: [
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: _buildVisible(state),
                  ),
                ),
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
    );
  }
  Widget _buildVisible(AppState state) {
    if(state is InitialHomeAction){
      return Container(color: Colors.orange,);
    }
     else if (state is LoadingHomeAction) {
      return Container(color: Colors.blue,);
    } else if (state is SuccessHomeAction) {
      return Container(color: Colors.black,);
    } else if (state is ErrorHomeAction) {
      return Container(color: Colors.green,);
    }
    throw ArgumentError('No view for state: $state');
  }
}
