import 'package:flutter/material.dart';

class ButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const ButtonLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        onPressed: onPressed,
        color: const Color.fromARGB(255, 236, 107, 71),
        child: Text(textbutton, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
