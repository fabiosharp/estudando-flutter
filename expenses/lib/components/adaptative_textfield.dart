import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextfield extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function() onSubmitted;

  AdaptativeTextfield({
    this.controller,
    this.keyboardType = TextInputType.text,
    this.label,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return !Platform.isIOS
        ? Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: CupertinoTextField(
              placeholder: this.label,
              onSubmitted: (_) => this.onSubmitted,
              keyboardType: this.keyboardType,
              controller: this.controller,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
            ),
        )
        : TextField(
            decoration: InputDecoration(labelText: this.label),
            onSubmitted: (_) => this.onSubmitted,
            keyboardType: this.keyboardType,
            controller: this.controller,
          );
  }
}
