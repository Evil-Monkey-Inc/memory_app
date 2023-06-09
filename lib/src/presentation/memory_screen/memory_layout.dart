import 'package:flutter/material.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/data/model/create_memory_model.dart';
import 'package:memory/src/data/model/memory_model.dart';
import 'package:memory/src/data/services/network_services_impl.dart';
import 'package:memory/src/presentation/widgets/primary_button.dart';

import '../../data/repository/repository_impl.dart';

class MemoryLayout extends StatefulWidget {
  const MemoryLayout({Key? key}) : super(key: key);

  @override
  State<MemoryLayout> createState() => _MemoryLayoutState();
}

class _MemoryLayoutState extends State<MemoryLayout> {
  static const buttonText = "Add memory";
  static const appBarTitle = "Memory's Screen";
  static const muid = 'e729ecd2-b676-45b4-b3fc-3dce4f1752bf';

  static const defaultSpacer = SizedBox(height: 18);
  static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);

  @override
  void initState() {
    super.initState();
  }

  void fetchData() {
    RepositoryImpl(NetworkServiceImpl()).fetchMemories();
  }

  void sendData() {
    RepositoryImpl(NetworkServiceImpl()).sendNewData(
      CreateMemoryModel(
        title: 'TEST',
        description: 'test1',
        date: DateTime.now(),
      ),
    );
  }

  void updateData() {
    RepositoryImpl(NetworkServiceImpl()).updateData(
      MemoryModel(
        muid: muid,
        title: 'put_TEST11111111',
        description: 'PUT_description',
        date: DateTime.now(),
      ),
    );
  }

  void deleteData() {
    RepositoryImpl(NetworkServiceImpl()).deleteData(
      MemoryModel(muid: muid),
    );
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
            Expanded(child: Container()),
            Align(
              child: PrimaryButton(
                text: buttonText,
                onPressed: () {
                  //Navigator.pushNamed(context, AddMemoryScreen.path);
                  deleteData();
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
