import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldApartment extends StatelessWidget {
  final String hintText;
  final String label;
  final FaIcon icon;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool isSucre;
  final void Function()? onTapIcon;
  const TextFieldApartment({
    super.key,
    required this.hintText,
    required this.label,
    required this.icon,
    required this.myController,
    required this.valid,
    required this.isNumber,
    required this.isSucre,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: TextFormField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        controller: myController,
        validator: valid,
        obscureText: isSucre == false ? false : true,
        decoration: InputDecoration(
          hint: Text(
            hintText,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 30,
          ),
          label: Text(label),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Container(
              margin: EdgeInsets.only(top: 14, left: 17),
              child: icon,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
