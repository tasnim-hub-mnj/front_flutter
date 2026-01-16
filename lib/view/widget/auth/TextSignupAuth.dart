import 'package:flutter/material.dart';

class TextSignupAuth extends StatelessWidget {
  final String textOne;
  final String textTow;
  final void Function()? onTap;
  const TextSignupAuth({
    super.key,
    required this.textOne,
    required this.textTow,required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne),
        InkWell(
          onTap: onTap,
          child: Text(
            textTow,
            style: TextStyle(
              color: Color.fromARGB(255, 236, 107, 71),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
