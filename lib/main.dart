import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/provider/my-provider.dart';
import 'package:foodordering/screen/cart_page.dart';
import 'package:foodordering/screen/detail_page.dart';
import 'package:foodordering/screen/home_page.dart';
import 'package:foodordering/screen/login_page.dart';
import 'package:foodordering/screen/signup_page.dart';
import 'package:foodordering/screen/welcome_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff2b2b2b),
          appBarTheme: const AppBarTheme(
            color: Color(0xff2b2b2b)
          ),

          primarySwatch: Colors.blue,
        ),
          home : WelcomePage(),
         // // home : CartScreen(),
         // // home: DetailScreen(),
         // //   home:  const HomePage(),
      // home: StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (index, sncpshot) {
      //       if (sncpshot.hasData) {
      //         return LoginPage();
      //       }
      //       return const HomePage();
      //     }),
      ),
    );
  }
}

