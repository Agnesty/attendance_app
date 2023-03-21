import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      backgroundColor: Color(0xFFF8F9F9),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Color(0xFF0062CD),
                    )),
                Expanded(flex: 3, child: Column()),
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
            Container(
                child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      // color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Attendance History",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                            Image.asset("assets/images/Notification.png")
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Logs",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF042C5C),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: TabBar(
                                isScrollable: false,
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Color(0xFFDFE7F5)),
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelColor: Color(0xFF0047CC),
                                unselectedLabelColor: Colors.grey,
                                controller: _tabController,
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      'Day',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Week',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Month',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Year',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              SingleChildScrollView(
                                child: Container(
                                    //  color: Colors.blue,
                                    // margin: EdgeInsets.symmetric(horizontal :10),
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: 350,
                                    child: TabBarView(
                                        controller: _tabController,
                                        children: [
                                          // TabBar Day
                                          Container(
                                            child: ListView.builder(
                                              itemCount: 4,
                                              itemBuilder: (ctx, index) {
                                                return ListTile(
                                                  leading: Image.asset(
                                                      "assets/images/Rectangle.png"),
                                                  title: Text("Title"),
                                                  subtitle: Text("SubTitle"),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  contentPadding: EdgeInsets.only(left: 0),
                                                );
                                              },
                                            ),
                                          ),
                                          // TabBar Week
                                          Container(
                                            child: ListView.builder(
                                              itemCount: 4,
                                              itemBuilder: (ctx, index) {
                                                return ListTile(
                                                  leading: Image.asset(
                                                      "assets/images/Rectangle.png"),
                                                  title: Text("Title"),
                                                  subtitle: Text("SubTitle"),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                              
                                          //TabBar Month
                                          Container(
                                            child: ListView.builder(
                                              itemCount: 4,
                                              itemBuilder: (ctx, index) {
                                                return ListTile(
                                                  leading: Image.asset(
                                                      "assets/images/Rectangle.png"),
                                                  title: Text("Title"),
                                                  subtitle: Text("SubTitle"),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          //TabBar Year
                                          Container(
                                            child: ListView.builder(
                                              itemCount: 4,
                                              itemBuilder: (ctx, index) {
                                                return ListTile(
                                                  leading: Image.asset(
                                                      "assets/images/Rectangle.png"),
                                                  title: Text("Title"),
                                                  subtitle: Text("SubTitle"),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ])),
                              ),
                            ],
                          ),
                        ))),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
