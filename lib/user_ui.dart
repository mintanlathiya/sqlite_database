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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: txtuserNameContoller,
          ),
          MaterialButton(
            onPressed: () async{
             await LocalDatabase.insertData(User(userName: txtuserNameContoller.text));
             setState(() {

             });
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
