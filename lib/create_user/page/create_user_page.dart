import 'package:flutter/material.dart';
import 'package:vocabulary_game_quiz_app/create_user/controller/create_user_controller.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUserPage> {
  CreateUserController? controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = CreateUserController(context);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            controller!.backToHome();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Center(
              child: Text(
                'Input Name',
                style: TextStyle(fontSize: 44),
              ),
            ),
            TextFormField(
              controller: controller?.name,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please input your name";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(labelText: 'Input your name'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  bool validate = _formKey.currentState!.validate();
                  if (validate) {
                    controller?.goToPlayGame();
                  }
                },
                child: Text(
                  'Play',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
