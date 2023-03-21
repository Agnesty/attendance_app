import 'package:aplikasi_phincon/helpers/location_services.dart';
import 'package:aplikasi_phincon/models/check-in-out_model.dart';
import 'package:aplikasi_phincon/providers/auth_provider.dart';
import 'package:aplikasi_phincon/providers/checkinout_provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool _isLoading = false;
  bool _isCheckIn = false;
  bool _isCheckOut = false;
  DateTime _selectedDate = DateTime.now();
  String location = "";

  // void _getLocation() async {
  //   List<Placemark> placemark = await placemarkFromCoordinates(
  //       CheckInOutModel.lat, CheckInOutModel.long);
  //   setState(() {
  //     location =
  //         "${placemark[0].street}, ${placemark[0].administrativeArea}, ${placemark[0].postalCode}, ${placemark[0].country}";
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _startLocationService();
  // }

  // void _startLocationService() async {
  //   LocationService().initialize();

  //   LocationService().getLongitude().then((value) {
  //     setState(() {
  //       CheckInOutModel.long = value!;
  //     });
  //   });

  //   LocationService().getLatitude().then((value) {
  //     setState(() {
  //       CheckInOutModel.lat = value!;
  //     });
  //   });
  // }

  void _checkIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final timeStamp = DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now());
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final checkInOutProvider =
          Provider.of<CheckInOutProvider>(context, listen: false);
      final checkin = CheckInOutProvider(
        authProvider.token!,
        authProvider.userId!,
        [],
      );
      await checkin.usersCheck(CheckInOutModel(
        userId: authProvider.userId!,
        checkInTime: DateFormat('dd-MM-yyyy hh:mm a').parse(timeStamp),
      ));
      setState(() {
        _isLoading = false;
        _isCheckIn = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Check-in berhasil'),
        duration: Duration(seconds: 2),
      ));
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Check-in gagal'),
        duration: Duration(seconds: 2),
      ));
      print(error);
    }
  }

  void _checkOut() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final timeStamp = DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now());
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final checkInOutProvider =
          Provider.of<CheckInOutProvider>(context, listen: false);
      final checkInOut = CheckInOutModel(
        id: "-NR1d7ND4h6ffYwEVm9j",
        userId: authProvider.userId!,
        checkOutTime: DateFormat('dd-MM-yyyy hh:mm a').parse(timeStamp),
      );
      await checkInOutProvider.updateCheck(checkInOut.id!, checkInOut);
      setState(() {
        _isLoading = false;
        _isCheckIn = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Check-out berhasil'),
        duration: Duration(seconds: 2),
      ));
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Check-out gagal'),
        duration: Duration(seconds: 2),
      ));
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9F9),
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Color(0xFF0062CD),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Stack(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Your Attendance",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                    "assets/images/Notification.png"))
                          ],
                        ),
                      ]),
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.27,
                      ),
                      Container(
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height * 0.3185,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Container(
                                child: const Text(
                                  "Location",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF042C5C),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                color: Colors.transparent,
                                margin: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.23,
                                width: 370,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: _isCheckIn == true
                                              ? _checkOut
                                              : _checkIn,
                                          child: ListTile(
                                            leading: Image.asset(
                                                "assets/images/Rectangle (1).png"),
                                            title: Text("PT. Phincon"),
                                            subtitle: location != ""
                                                ? Text(location)
                                                : Text('blom ada alamat'),
                                            tileColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: _isCheckIn == true
                                              ? _checkOut
                                              : _checkIn,
                                          child: ListTile(
                                            leading: Image.asset(
                                                "assets/images/Rectangle (2).png"),
                                            title:
                                                Text("Telkomsel Smart Office"),
                                            subtitle: location != ""
                                                ? Text(location)
                                                : Text(
                                                    'Jl. Jend. Gatot Subroto Kav. 52. Jakarta Selatan'),
                                            tileColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: _isCheckIn == true
                                              ? _checkOut
                                              : _checkIn,
                                          child: ListTile(
                                            leading: Image.asset(
                                                "assets/images/Rectangle.png"),
                                            title: Text("Rumah"),
                                            subtitle: location != ""
                                                ? Text(location)
                                                : Text('Jakarta'),
                                            tileColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Positioned(
            left: 210,
            top: -220,
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
              width: MediaQuery.of(context).size.width * 0.9,
              height: 285,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hour : ${DateFormat("HH:mm").format(DateTime.now())}",
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF77869E)),
                              ),
                              Text(
                                DateFormat('dd MMMM y').format(_selectedDate),
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF77869E)),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/login-screen');
                        Provider.of<AuthProvider>(context, listen: false)
                            .logout();
                      },
                      child: Container(
                        width: 195,
                        height: 195,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isCheckIn == true
                              ? Color(0xFFF7B500)
                              : Color(0xFF11C04D),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFBBBBBB).withOpacity(0.5),
                              offset: Offset(0, 0),
                              blurRadius: 20,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Center(
                          child: _isCheckIn == true
                              ? const Text(
                                  "CHECK OUT",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  "CHECK IN",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
