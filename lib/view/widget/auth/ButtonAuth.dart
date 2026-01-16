import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        color: const Color.fromARGB(255, 236, 107, 71),
        textColor: Colors.white,
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
