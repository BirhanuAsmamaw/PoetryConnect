import 'package:flutter/material.dart';
import 'package:poem/screens/login_page.dart';
import 'package:poem/widgets/custom_widget.dart';
import 'package:poem/widgets/mixin/validator.dart';
import 'package:poem/widgets/password.dart';
import 'package:poem/widgets/role.dart';
import 'package:poem/widgets/username.dart';

import '../widgets/email.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole;
  String? role;
  // String? usernameError;
  // String? emailError;
  // String? passwordError;

  // final username = ;
  // final email =

  // TextFormField password =

  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 5,
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.only(left: 22),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: _formMethod(context),
            ),
          ),
        ],
      ),
    );
  }

  Form _formMethod(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome to a Poetry Haven!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Username ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Colors.black87, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    ),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
              const Username(),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Email ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Colors.black87, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    ),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
              Email(
                onEmailChanged: (String) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Password ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Colors.black87, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    ),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
              const Password(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Role ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Colors.black87, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    ),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
              Role(onChanged: (value) {
                setState(() {
                  role = value;
                });
              }),
              const SizedBox(height: 30),
              Center(
                  child: Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(330, 45),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Check the role and navigate accordingly
                      if (role == 'enthusiast') {
                        Navigator.pushNamed(context, '/userPage');
                      } else if (role == 'poet') {
                        Navigator.pushNamed(context, '/mainAdminPage');
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Form not submitted'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27),
                  ),
                ),
              )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text(
                    'Already have an account? Login here',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ));
  }
}
