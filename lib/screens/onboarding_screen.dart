import 'package:aplikasi_phincon/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import '../widgets/contents.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static String routeName = "/onboardingscreen";
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  List<Map<String, String>> ContentData = [
    {
      "judul": "DIGITAL ABSENSI",
      "subtext":
          "Kehadiran sistem absensi digital merupakan penemuan yang mampu menggantikan pencatatan data kehadiran secara manual",
      "image": "assets/images/icons-time-attendance-clocks.png"
    },
    {
      "judul": "ATTENDANCE SYSTEM",
      "subtext":
          "Pengelolaan karyawan di era digital yang baik, menghasilkan karyawan terbaik pula, salah satunya absensi karyawan",
      "image": "assets/images/icons-employee-self-service.png"
    },
    {
      "judul": "SELALU PAKAI MASKER",
      "subtext":
          "Guna mencegah penyebaran virus Covid-19, Pemerintah telah mengeluarkan kebijakan Physical Distancing serta kebijakan bekerja, belajar, dan beribadah dari rumah.",
      "image": "assets/images/mask1.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF8F9F9),
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.transparent,
                    )),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(ContentData.length,
                              (index) => buildDot(index: index)),
                        ),
                        const SizedBox(
                          height: 42,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DefaultButton(
                              text: "Login",
                              press: () {
                                Navigator.of(context).pushNamed(LoginScreen.routeName);
                              },
                            ),
                            DefaultButton(
                              text: "Sign Up",
                              press: () {
                                Navigator.of(context).pushNamed(SignUpScreen.routeName);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 5,
                          width: 134,
                          decoration: const BoxDecoration(
                              color: Color(0xFF393939),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.74,
              child: Flex(direction: Axis.horizontal, children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: ContentData.length,
                    itemBuilder: (context, index) => Content(
                      judul: ContentData[index]["judul"],
                      image: ContentData[index]["image"],
                      text: ContentData[index]["subtext"],
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("bau");
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                          color: Color(0xFF77869E),
                          fontSize: 13,
                          fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      width: currentPage == index ? 10 : 6,
      height: currentPage == index ? 10 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? Color(0xFF042C5C) : Color(0xFFD8D8D8),
      ),
    );
  }
}
