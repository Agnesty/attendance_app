import 'package:flutter/material.dart';

class ListTileProfile extends StatelessWidget {
  final String judul;
  final String subtitle;
  final String image;
  const ListTileProfile({super.key, required this.judul, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10.0),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFFDFE7F5),
        ),
        child: Image.asset(
          image,
          width: 24,
          height: 20,
        ),
      ),
      title: Text(
        judul,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF042C5C)),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xFF77869E)),
      ),
      tileColor: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
