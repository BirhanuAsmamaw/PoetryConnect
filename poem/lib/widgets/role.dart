import 'package:flutter/material.dart';
import 'package:poem/widgets/mixin/validator.dart';

class Role extends StatefulWidget {
  final void Function(String?) onChanged;
  const Role({super.key, required this.onChanged});

  @override
  State<Role> createState() => _RoleState();
}

class _RoleState extends State<Role> with ValidationMixin {
  final TextEditingController roleController = TextEditingController();
  String? roleError;
  String? role;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextFormField(
        controller: roleController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'poet, or enthusiast',
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          errorText: roleError,
          border: const OutlineInputBorder(),
        ),
        style: const TextStyle(
          color: Colors.black87,
        ),
        onChanged: (value) {
          setState(() {
            roleError = roleValidation(value);
            role = value;
          });
          widget.onChanged(value);
        },
        validator: roleValidation,
      ),
    );
  }
}
