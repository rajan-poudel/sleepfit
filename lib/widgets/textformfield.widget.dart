import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextEditingController textEditingController;
  IconData iconData;
  TextInputType textInputType;
  String errorMessage;
  bool isEmail;
  String labelText;
  TextFormFieldWidget({
    super.key,
    required this.textEditingController,
    required this.iconData,
    required this.textInputType,
    required this.errorMessage,
    this.isEmail = false,
    this.labelText = "",
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$errorMessage*";
        } else if (isEmail) {
          Pattern pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = RegExp(pattern.toString());
          if (!regex.hasMatch(value)) {
            return 'Enter Valid Email';
          }
        }

        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        label: Text(labelText),
        filled: true,
        fillColor: const Color(0xffF7F8F8),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8),
          child: FaIcon(
            iconData,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}