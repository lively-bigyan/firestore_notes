import 'package:firestore_note/views/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  final AuthController ctrl = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => ctrl.handleGoogleSignIn(),
          color: Colors.blue[800],
          child: Text(
            "Sign in with Google",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
