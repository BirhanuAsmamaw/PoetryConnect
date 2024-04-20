import 'package:flutter/material.dart';
import 'package:poem/widgets/mixin/validator.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> with ValidationMixin {
  final TextEditingController passwordController = TextEditingController();
  String? passwordError;
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    setState(() {
      _passwordVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.red,
            ),
            hintText: 'password',
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            errorText: passwordError,
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          style: const TextStyle(
            color: Colors.black87,
          ),
          onChanged: (value) {
            setState(() {
              passwordError = passwordValidation(value);
            });
          },
          obscureText: !_passwordVisible,
          validator: passwordValidation),
    );
  }
}
