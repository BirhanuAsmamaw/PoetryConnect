import 'package:flutter/material.dart';
import 'package:poem/widgets/mixin/validator.dart';

class Username extends StatefulWidget {
  const Username({super.key});
  @override
  State<StatefulWidget> createState() {
    return _usernameState();
  }
}

class _usernameState extends State<Username> with ValidationMixin {
  final TextEditingController usernameController = TextEditingController();
  String? usernameError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
            hintText: 'your username ...',
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            errorText: usernameError,
            border: const OutlineInputBorder(),
          ),
          style: const TextStyle(
            color: Colors.black87,
          ),
          onChanged: (value) {
            setState(() {
              usernameError = usernameValidation(value);
            });
          },
          validator: usernameValidation),
    );
  }
}
