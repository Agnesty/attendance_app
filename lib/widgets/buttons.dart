import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? press;
  final String? text;
 const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155.5,
      height: 48,
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF0063C6),),
        child: Text(text!, style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),),
      ),
    );
  }
}