import 'package:flutter/material.dart';

class TextFormFieldKu extends StatelessWidget {
  TextEditingController? controller;
  String? hintName;
  String judulForm;
  IconData? icon;
  bool isObscureText;
  TextInputType inputType;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  // bool isEnable;

  TextFormFieldKu(
      {this.controller,
      this.hintName,
      required this.judulForm,
      this.icon,
      this.isObscureText = false,
      this.inputType = TextInputType.text,
      this.validator,
      this.onSaved,
      // this.isEnable = true
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(judulForm, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0000000).withOpacity(0.5)),),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            obscureText: isObscureText,
            // enabled: isEnable,
            keyboardType: inputType,
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 8),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xFFDCDCDC)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xFF0062CD)),
              ),
              prefixIcon: Icon(icon),
              hintText: hintName,
            ),
          ),
        ],
      ),
    );
  }
}
