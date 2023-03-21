import 'package:aplikasi_phincon/providers/user_provider.dart';
import 'package:aplikasi_phincon/widgets/listtile_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context)!.settings.arguments as String;
    // final user = Provider.of<UserProvider>(context, listen: false).findById(productId);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(32)),
                      color: Color(0xFF0047CC),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              // print('botola');
                            },
                            child: Image.asset("assets/images/Shape.png"))
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Color(0xFFF8F9F9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.14,
                        ),
                        Container(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height * 0.36,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Container(
                                  child: const Text(
                                    "GENERAL",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF77869E),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  color: Colors.transparent,
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  height: MediaQuery.of(context).size.height *
                                      0.294,
                                  width: 370,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ListTileProfile(
                                            image: "assets/images/Object.png",
                                            judul: 'No. Karyawan',
                                            subtitle: 'NIK-0909090909',
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTileProfile(
                                            image: 'assets/images/Object (1).png',
                                            judul: 'Alamat',
                                            subtitle: 'Jakarta Selatan',
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTileProfile(
                                            image: 'assets/images/Object (2).png',
                                            judul: 'Change Password',
                                            subtitle: '*************',
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Positioned(
            left: 200,
            top: -150,
            child: Container(
              width: 319,
              height: 319,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05)),
            ),
          ),
          Positioned(
              top: 100,
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 372,
                  height: 241,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/ricardo.png",
                            width: 80,
                            height: 80,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "mpok",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF042C5C)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "PROGRAMER",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF77869E)),
                      ),
                    ],
                  )))
        ],
      )),
    );
  }
}
