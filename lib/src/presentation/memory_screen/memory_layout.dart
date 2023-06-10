import 'package:flutter/material.dart';
import 'package:memory/src/colors_pallet/total_palette.dart';
import 'package:memory/src/data/model/create_memory_model.dart';
import 'package:memory/src/data/model/memory_model.dart';
import 'package:memory/src/data/services/network_services_impl.dart';
import 'package:memory/src/data/services/storage_service.dart';
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

  static const defaultSpacer = SizedBox(height: 18);
  static const screenPadding = EdgeInsets.symmetric(horizontal: 12.0);
  final repo = RepositoryImpl(NetworkServiceImpl(), StorageServiceImpl());

  Future<List<MemoryModel>> fetchData() async {
    return await repo.fetchMemories();
  }

  Future<void> sendData() async {
    await repo.sendNewData(
      CreateMemoryModel(
        title: 'TEST01',
        description: 'test100',
        date: DateTime.now(),
      ),
    );
  }

  Future<void> updateData(String muid) async {
    await repo.updateData(
      MemoryModel(
        muid: muid,
        title: 'put_TEST2221111',
        description: 'PUT_description22',
        date: DateTime.now(),
      ),
    );
  }

  Future<void> deleteData(String muid) async {
    await repo.deleteData(muid);
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
                onPressed: () async {
                  //Navigator.pushNamed(context, AddMemoryScreen.path);
                  print('\n\n\n');
                  final memos = await fetchData();
                  print(memos.length);

                  final muid = memos.first.muid;

                  // await sendData();
                  await updateData(muid);
                  await deleteData(muid);

                  final memos2 = await fetchData();

                  final muid2 = memos2.first.muid;
                  await deleteData(muid2);


                  final memos3 = await fetchData();
                  print(memos3.length);

                  print('\n\n\n');
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
