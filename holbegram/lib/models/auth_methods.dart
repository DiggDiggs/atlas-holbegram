import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:typed_data';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Login method
  Future<String> login({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return "Please fill all the fields";
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "success";
    } catch (e) {
      return e.toString(); // Return the error message
    }
  }

  // Sign up method
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file,
  }) async {
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      return "Please fill all the fields";
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      // Assuming you have a User class with a toJson method
      // Replace 'User' with your actual user class
      // Users users = Users(username: username, email: email, ...);

      // Example User class, you might have a different implementation
      var userData = {
        'username': username,
        'email': email,
        // Add other fields as necessary
      };

      await _firestore.collection("users").doc(user!.uid).set(userData);
      return "success";
    } catch (e) {
      return e.toString(); // Return the error message
    }
  }
}
