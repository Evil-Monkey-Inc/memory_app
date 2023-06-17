import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/data/model/memory_model.dart';
import 'package:memory/src/presentation/add_memory_screen/add_memory_screen.dart';
import 'package:memory/src/presentation/widgets/primary_button.dart';
import 'package:memory/src/redux/actions/home_actions.dart';
import 'package:memory/src/redux/state.dart';

class MemoryLayout extends StatelessWidget {
   MemoryLayout({super.key});

  static const buttonText = "Add memory";
  static const appBarTitle = "Memory's Screen";

  static const defaultSpacer = SizedBox(height: 18);
  static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);

  final appBarProperty = TextStyle(fontSize: 20.0, color: TotalPalette.textColor);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      onInit:(store) => store.dispatch(LoadingHomeAction()),
        builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: TotalPalette.primaryColor,
            title: Text(appBarTitle, style: appBarProperty),
            centerTitle: true,
          ),
          body: Padding(
            padding: screenPadding,
            child: Column(
              children: [
                 Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
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
                    textButtonColor: TotalPalette.textColor,
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
      if(state.homeState is HomeInitial){
      return Container(color: Colors.orange,);
    }
     else if (state.homeState is HomeLoading) {

      return Container(color: Colors.blue,);
    } else if (state.homeState is HomeSuccess) {
        final successState = state.homeState as HomeSuccess;
        final memoryModels = successState.memoryModels;

        return ListView.builder(
          itemCount: memoryModels.length,
          itemBuilder: (context, index) {
            final memoryModel = memoryModels[index];
            return ListTile(
              title: Text(memoryModel.title),
              subtitle: Text(memoryModel.description),
              // You can display other properties as needed
            );
          },
        );

    } else if (state.homeState is HomeError) {
      return Container(color: Colors.green,);
    }
   return Container(color: Colors.black12,);
  }
}
