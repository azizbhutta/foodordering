import 'package:flutter/material.dart';
import 'package:foodordering/Widget/text_field.dart';
import 'package:foodordering/screen/welcome_page.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController logPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                MyTextField(hintText: 'User Name', icon: Icons.person_outline, iconColor: Colors.white, obscureText: false, controller: name,),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(hintText: 'Password', icon: Icons.lock_outline, iconColor: Colors.white, obscureText: true, controller: logPassword,),
              ],
            ),
            MaterialButton(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                elevation: 5.0,
                minWidth: 200.0,
                height: 40,
                color: Colors.grey,
                child: const Text('LogIn',
                    style:  TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: (){
                  const WelcomePage();
                }),
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
