import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obscuerText;
  final TextEditingController controller;
  final FocusNode? focusNode;

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.obscuerText,
    required this.controller,
    this.focusNode,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
          obscureText: obscuerText,
          controller: controller,
          focusNode: focusNode,

          decoration: InputDecoration( //กำหนดลักณะtextfield
              enabledBorder: OutlineInputBorder( //เมื่อไม่focus
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary)),
              focusedBorder: OutlineInputBorder( //เมื่อfocus
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              fillColor: Theme.of(context).colorScheme.surface, //สีพื้นหลัง
              filled: true,
              hintText: hintText,
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary))),
    );
  }
}
