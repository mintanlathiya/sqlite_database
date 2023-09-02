import 'package:flutter/material.dart';
import 'package:sqlite_database/local_database.dart';
import 'package:sqlite_database/user_modal.dart';

class UserUi extends StatefulWidget {
  const UserUi({super.key});

  @override
  State<UserUi> createState() => _UserUiState();
}

class _UserUiState extends State<UserUi> {
  TextEditingController txtuserNameContoller = TextEditingController();
  late Future<List<User>> futureUserData;
  bool isUpdate = false;
  int selectedId = 0;
  @override
  void initState() {
    futureUserData = LocalDatabase.selectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: txtuserNameContoller,
            ),
            MaterialButton(
              onPressed: isUpdate
                  ? () async {
                      User obj = User(
                          userName: txtuserNameContoller.text, id: selectedId);
                      await LocalDatabase.updateData(obj);
                      futureUserData = LocalDatabase.selectData();
                      isUpdate = false;

                      setState(() {});
                    }
                  : () async {
                      await LocalDatabase.insertData(
                          User(userName: txtuserNameContoller.text));
                      futureUserData = LocalDatabase.selectData();
                      setState(() {});
                    },
              child: Text(isUpdate ? 'update' : 'Submit'),
            ),
            const SizedBox(height: 10),
            FutureBuilder(
              future: futureUserData,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            isUpdate = true;
                            txtuserNameContoller.text =
                                snapshot.data![index].userName;
                            selectedId = snapshot.data![index].id!;

                            setState(() {});
                          },
                          child: Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) async {
                              await LocalDatabase.deleteData(
                                  snapshot.data![index].id!);
                              futureUserData = LocalDatabase.selectData();
                              isUpdate = false;
                              setState(() {});
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index].userName),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Text('there is no data');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
