import 'package:flutter/material.dart';

import 'buttons.dart';

class Content extends StatelessWidget {
  String? text, image, judul;
  Content({
    Key? key,
    required this.text,
    required this.image,
    required this.judul,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 80,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              width: 163.2,
              height: 220,
            ),
          ],
        ),
        const SizedBox(height: 90,),
        Column(
          children: [
            Text(
              judul!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: 328,
              height: 60,
              child: Text(
                text!,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF77869E)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

        // ),
      ],
    );
  }
}
