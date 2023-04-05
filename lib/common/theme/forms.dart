import 'package:flutter/material.dart';

const emailTextFieldDecorator = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.purple, width: 1.5),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  hintText: 'Email',
);
const passTextFieldDecorator = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.purple, width: 1.5),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  hintText: 'Password',
);

const roleTextFieldDecorator = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.purple, width: 1.5),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  hintText: 'Role',
);
