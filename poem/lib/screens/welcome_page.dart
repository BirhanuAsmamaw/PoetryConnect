import 'package:flutter/material.dart';
import 'package:poem/screens/login_page.dart';
import 'package:poem/screens/sign_up_page.dart';
import 'package:poem/widgets/custom_button.dart';
import 'package:poem/widgets/custom_widget.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
    _controller!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      child: _welcomeColumn(),
    );
  }
  Column _welcomeColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                    ).createShader(bounds);
                  },
                  child: const Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CustomButton(
                buttonText: 'Sign in',
                color: Color.fromARGB(255, 4, 213, 250),
                onTap: LoginPage(),
              ),
            ),
            Expanded(
              child: CustomButton(
                buttonText: 'Sign Up',
                color: Colors.blue,
                onTap: SignUp(),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => WelcomeImagePage()),
          //   );
          // },
          child: Icon(
            Icons.image,
            size: 50,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
