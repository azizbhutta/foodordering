import 'package:flutter/material.dart';
import 'package:foodordering/screen/login_page.dart';
import 'package:foodordering/screen/signup_page.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            child: Center(
              child: Image.asset('assets/images/logo.jpg'),
            ),
          )),
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Welcome To Tasty Food',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blueGrey),
                ),
                Column(
                  children: const [
                    Text('Order Food From Our Resturant and \n    Make Reservation In Real_Time')
                  ],
                ),

                MaterialButton(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: 300.0,
                      height: 40,
                      color: const Color(0xFF801E48),
                      child: const Text('LogIn',
                          style:  TextStyle(fontSize: 16.0, color: Colors.white)),
                    onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
                }),

                MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    minWidth: 300.0,
                    height: 40,
                    color:Colors.white,
                    child: const Text('SignUp',
                        style:  TextStyle(fontSize: 16.0, color: Colors.blueGrey)),
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const SignUp()));
                    }),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
