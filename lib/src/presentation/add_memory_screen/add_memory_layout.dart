import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/presentation/widgets/date_picker_widget.dart';
import 'package:memory/src/presentation/widgets/primary_button.dart';
import 'package:memory/src/presentation/widgets/input_widget.dart';
import 'package:memory/src/redux/state.dart';

class AddMemoryLayout extends StatefulWidget {
  const AddMemoryLayout({super.key});

  @override
  State<AddMemoryLayout> createState() => _AddMemoryLayoutState();
}

class _AddMemoryLayoutState extends State<AddMemoryLayout> {
  final _datePickerController = TextEditingController();
  final _titleController = TextEditingController();

  static const appBarTitle = 'Add memory';
  static const buttonText = 'Remember moment ❤️';
  static const labelTextTitle = 'Enter memory title';
  static const datePickerTitle = 'Enter memory date';
  static const labelTextDescription = 'Enter memory description';

  static const maxLines = 5;
  static const topSpacer = SizedBox(height: 24);
  static const defaultSpacer = SizedBox(height: 18);
  static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);
  final appBarProperty = TextStyle(fontSize: 20.0, color: TotalPalette.textColor);

  bool get isButtonEnabled {
    if (!mounted) return false;
    return _datePickerController.text.isNotEmpty && _titleController.text.isNotEmpty;
  }

  @override
  void initState() {
    _datePickerController.addListener(() => setState(() {}));
    _titleController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _datePickerController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        onInit:(store) => store.dispatch(EditMemoryLoading()),
        builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon:  const Icon(Icons.arrow_back, color: Colors.black,),
            ),
            backgroundColor: TotalPalette.primaryColor,
            title: Text(
              appBarTitle,
              style: appBarProperty,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: screenPadding,
            child: _buildVisible(state),
          ),
        );
      }
    );
  }
  Widget _buildVisible(AppState state) {
      if(state.editMemoryState is EditMemoryInitial){
      return Container(color: Colors.orange,);
    }
    else if (state.editMemoryState is EditMemoryLoading) {
      return const Expanded(child: CircularProgressIndicator());
    } else if (state.editMemoryState is EditMemorySuccess) {
      return Column(
      children: [
        topSpacer,
        InputWidget(
          labelText: labelTextTitle,
          titleController: _titleController,
        ),
        defaultSpacer,
        DatePickerWidget(
          datePickerTitle: datePickerTitle,
          dateController: _datePickerController,
        ),
        defaultSpacer,
        InputWidget(
          labelText: labelTextDescription,
          maxLines: maxLines,
          onChanged: (value) {
          },
        ),
        const Spacer(),
        PrimaryButton(
          isEnabled: isButtonEnabled,
          text: buttonText,
          onPressed: () {

          },
          buttonColor: TotalPalette.primaryColor,
          textButtonColor: TotalPalette.scaffoldBackgroundColor,
        ),
        defaultSpacer,
      ],
      );
    } else if (state.editMemoryState is EditMemoryError) {
      return Container(color: Colors.green,);
    }
    return Container(color: Colors.black12,);
  }
}
