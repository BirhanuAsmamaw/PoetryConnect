import 'package:flutter/material.dart';
import 'package:poem/widgets/mixin/validator.dart';

class Email extends StatefulWidget {
  final Function(String) onEmailChanged;

  const Email({super.key, required this.onEmailChanged});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> with ValidationMixin {
  String? emailError;
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.green,
          ),
          hintText: 'adeyeshi@gmail.com',
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          errorText: emailError,
          border: const OutlineInputBorder(),
        ),
        style: const TextStyle(
          color: Colors.black87,
        ),
        onChanged: (value) {
          setState(() {
            emailError = emailValidation(value);
          });
          widget.onEmailChanged(value);
        },
      ),
    );
  }
}
