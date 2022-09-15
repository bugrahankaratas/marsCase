import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../helper/snackbar.dart';

class FBAuth {
  static FBAuth? _instance;
  static FBAuth get instance {
    return _instance ??= FBAuth();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late BuildContext _context;

  // Future<User?> createUser(String email, String password) async {
  //   var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

  //   await _firestore.collection('User').doc(user.user!.uid).set({email: email});
  //   return user.user;
  // }

  Future<User?> createUser(String email, String password, BuildContext context) async {
    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await _firestore.collection('User').doc(user.user!.uid).set({'email': email});
      return user.user;
    } on FirebaseAuthException catch (e) {
      ShowSnackBar.showErrorSnackBar(context, e.message ?? '');
    }
    return null;
  }

  Future<User?> signIn(String email, String password, BuildContext context) async {
    try {
      var user = await auth.signInWithEmailAndPassword(email: email, password: password);
      return user.user;
    } on FirebaseAuthException catch (e) {
      ShowSnackBar.showErrorSnackBar(context, e.message ?? '');
    }
    return null;
  }

  signOut() async {
    return await auth.signOut();
  }
}
