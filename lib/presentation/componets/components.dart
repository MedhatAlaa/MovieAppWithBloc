import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: constant_identifier_names
enum ToastState { SUCCESS, ERROR, WARNING }

Future<bool?> showToast(String message,
    ToastState state,) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

Color toastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
    case ToastState.ERROR:
      color = Colors.red;
    case ToastState.WARNING:
      color = Colors.amber;
  }
  return color;
}

class TextFormFiledComponent extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool obscureText;
  final Color? cursorColor;
  final String? Function(String?)? validate;
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final Color? textStyleColor;

  const TextFormFiledComponent({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    required this.labelText,
    required this.hintText,
    required this.validate,
    this.cursorColor,
    this.suffixIcon,
    this.textStyleColor,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: textStyleColor),
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: obscureText,
      cursorColor: cursorColor,
      validator: validate,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class GetTitle extends StatelessWidget {
  const GetTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        style: Theme
            .of(context)
            .textTheme
            .titleMedium);
  }
}


