import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widget/text_field.dart';

class SignUp extends StatefulWidget {

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegExp email_valid = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  bool loading = false;
   late UserCredential userCredential;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
      userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user?.uid)
          .set({
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "email": email.text.trim(),
        "userid": userCredential.user?.uid,
        "password": password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                     content: Text("The password provided is too weak.")));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("The account already exists for that email"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error.")));
      setState(() {
        loading=false;
      });
    }
    setState(() {
      loading=false;
    });
  }


  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("First Name is Empty")));
    }
    else if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Last Name is Empty")));
    }
    else if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email is Empty")));
    } else if (!email_valid.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please Enter Valid Email")));
    }
    else if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password is Empty")));
    }
    else{
      setState(() {
        loading=true;
      });
      sendData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'DynaPuff',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTextField(
                  hintText: 'Fisrt Name',
                  icon: Icons.person,
                  iconColor: Colors.grey,
                  obscureText: false,
                  controller: firstName,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: 'Last Name',
                  icon: Icons.person_outline,
                  iconColor: Colors.grey,
                  obscureText: false,
                  controller: lastName,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: 'Email',
                  icon: Icons.email_outlined,
                  iconColor: Colors.grey,
                  obscureText: false,
                  controller: email,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: 'Pasword',
                  icon: Icons.lock_outline,
                  iconColor: Colors.grey,
                  obscureText: true,
                  controller: password,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
           loading? Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
               CircularProgressIndicator()
             ],
           )
               : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    minWidth: 150.0,
                    height: 40,
                    color: Colors.grey,
                    child: const Text('Cancel',
                        style: TextStyle(fontSize: 20.0, color: Colors.black)),
                    onPressed: () {}),
                const SizedBox(
                  width: 20,
                ),
                MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    minWidth: 150.0,
                    height: 40,
                    color: Colors.grey,
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onPressed: validation
                    )
              ],
            )
          ],
        ),
      ),
    );
  }
}
