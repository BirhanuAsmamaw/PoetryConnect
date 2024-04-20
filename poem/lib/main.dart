import 'package:flutter/material.dart';
import 'package:poem/screens/about.dart';
import 'package:poem/screens/contacts.dart';
import 'package:poem/screens/login_page.dart';
import 'package:poem/screens/main_page.dart';
import 'package:poem/screens/sign_up_page.dart';
import 'package:poem/screens/user_screen.dart';
import 'package:poem/screens/welcome_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poem Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Welcome(),
      routes: {
        '/welcome': (context) => const Welcome(),
        '/signup': (context) => const SignUp(),
        '/signin': (context) => const LoginPage(),
        '/contact': (context) => const Contact(),
        '/userPage': (context) => UserApp(),
        '/about': (context) => const About(),
        '/mainAdminPage': (context) => const MyApp(),
      },
    );
  }
}
