import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class Auth {


  Future<void> login(
      BuildContext context, String email, String password) async {
    print("--" * 30);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Connexion réussie'),
            content: Text('User ID: ${userCredential.user!.uid}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

      Navigator.pushReplacementNamed(context, "/todos");
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      // Handle error, show error message, etc.
    }
  }
}
