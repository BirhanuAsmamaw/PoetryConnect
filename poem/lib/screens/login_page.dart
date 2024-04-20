import 'package:flutter/material.dart';
import 'package:poem/screens/sign_up_page.dart';
import 'package:poem/widgets/custom_widget.dart';
import 'package:poem/widgets/password.dart';
import 'package:poem/widgets/role.dart';
import 'package:poem/widgets/username.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? role;

  late bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 12,
            ),
          ),
          _expandedForm(context),
        ],
      ),
    );
  }

  Expanded _expandedForm(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        padding: const EdgeInsets.only(left: 22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: _formMethod(context),
      ),
    );
  }

  Form _formMethod(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome to the Poetry Haven!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
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
                height: 30,
              ),
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
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Password ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 33, 240, 243),
                            Color.fromARGB(255, 175, 97, 76)
                          ],
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
              const SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(330, 45),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
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
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  child: const Text(
                    'Don\'t have an account? sign up here',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ));
  }
}
