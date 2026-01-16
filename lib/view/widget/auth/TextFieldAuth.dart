import 'package:flutter/material.dart';

class TextFieldAuth extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData icon;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool isSucre;
  final void Function()? onTapIcon;
  const TextFieldAuth({
    super.key,
    required this.hintText,
    required this.label,
    required this.icon,
    required this.myController,
    this.valid,
    required this.isNumber,
    required this.isSucre,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        label: Text(label),
        suffixIcon: InkWell(onTap: onTapIcon, child: Icon(icon)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
