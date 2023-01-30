import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/Widget/text_field.dart';
import 'package:foodordering/screen/welcome_page.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RegExp valid = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  bool loading = false;
  late UserCredential userCredential;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();



  Future loginAuth() async{
    try {
      userCredential  = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'email.text',
          password: 'Password.text'
      );
    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("No user found for that email.")));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong password provided for that user')));
        print('Wrong password provided for that user.');
        setState(() {
          loading=false;
        });
      }
      setState(() {
        loading=false;
      });
    }
  }

  void validation(){
    if(email.text.trim().isEmpty || email.text.trim()== null && password.text.trim().isEmpty || password.text.trim()== null){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter email & password')));
    }
    else if (email.text.trim().isEmpty || email.text.trim()== null){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Eamil is empty')));
    }
    else if (!valid.hasMatch(email.text)){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Enter Valid Email')));
    }
    else if (password.text.trim().isEmpty || password.text.trim()== null){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password is empty')));
    }
    else{
      setState(() {
        loading=true;
      });
      loginAuth();
      }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: null,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 40,right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'Log In ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white,fontFamily: 'DynaPuff',),
              ),
            ),
            Column(
              children:  [
                MyTextField(hintText: 'Email', icon: Icons.email_outlined, iconColor: Colors.white, obscureText: false, controller: email,),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(hintText: 'Password', icon: Icons.lock_outline, iconColor: Colors.white, obscureText: true, controller: password,),
              ],
            ),
            loading? const CircularProgressIndicator() :MaterialButton(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                elevation: 5.0,
                minWidth: 200.0,
                height: 40,
                color: Colors.grey,
                child: const Text('LogIn',
                    style:  TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: validation
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('New User',style: TextStyle(color: Colors.grey),),
                Text('Register now.',style: TextStyle(color: Colors.red),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
