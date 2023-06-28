

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wagwan/api/apis.dart';
import 'package:wagwan/screens/home_screen.dart';

class AuthController extends GetxController{
  final loginkey=GlobalKey<FormState>().obs;
  final registerKey=GlobalKey<FormState>().obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var emailController=TextEditingController().obs;
  var passwordController=TextEditingController().obs;
  var usernameController=TextEditingController().obs;

  login(context)async{
    var image="";
    try {
      auth.signInWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text
      ).then((user) async {
        if (user != null) {
          log('\nUser: ${user.user}');
          log('\nUserAdditionalInfo: ${user.additionalUserInfo}');
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));

          if ((await APIs.userExists())) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          } else {
            await APIs.createUser(
              emailController.value.text,
              usernameController.value.text,
              image

            ).then((value) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
            }).onError((error, stackTrace) {
              print(error);
            });
          }
        }
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


  register(context)async{
    var  image ="";

    try {
      await auth.createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text
      ).then((user) async {
        // Navigator.pop(context);
        if (user != null) {
            await APIs.createUser(
                emailController.value.text,
                usernameController.value.text,
                image

            ).then((value) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
            });
        }
      });

      print("SUCCESS_REG");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }


  getAuth(context)async{
    auth.authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');

      } else {
        print('User is signed in!');
        print(user);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));


      }
    });
  }
}

