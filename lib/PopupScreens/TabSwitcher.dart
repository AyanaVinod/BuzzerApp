import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../Colors/colors.dart';
import '../Players/PlayerJoiningRoom.dart';
import '../Screens/PinGenerated.dart';
import '../Masters/MasterJoiningRoom.dart';
import '../Screens/QRGenerated.dart';


class StackPop extends StatefulWidget {
  const StackPop(BuildContext context, {super.key});

  @override
  _StackPopState createState() => _StackPopState();
}

class _StackPopState extends State<StackPop>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: popupBackground1,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
        child: Column(
          children: [
            // give the tab bar a height [can change height to preferred height]
            Container(
              height: 35,
              width: 200,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                controller: _tabController,
                indicator: RectangularIndicator(
                  color:borderHomeColor,
                  bottomLeftRadius: 80,
                  bottomRightRadius: 80,
                  topLeftRadius: 80,
                  topRightRadius: 80,
                  paintingStyle: PaintingStyle.stroke,
                ),
                labelColor: textYellow,
                labelStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500),
                unselectedLabelStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500),
                unselectedLabelColor: textYellow,
                tabs: const [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Master',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Room',
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(255, -30, 0),
              child: Row(
                children: [
                  Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: borderHomeColor, width: 1.0),
                          color: popupBackground1,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              CupertinoIcons.multiply,
                              size: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRGenerated()));
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/images/ic_qrcode.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 54,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => PINGenerated()));
                                  //builder: (context) =>  TeamRoom()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/images/ic_pin.png'),
                        ),
                      ),
                    ],
                  ),

                  // second tab bar view widget
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRGenerated()));
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/images/ic_qrcode.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 54,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PINGenerated()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/images/ic_pin.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                transform: Matrix4.translationValues(-10, -30, 0),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Generate QR',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Gilroy'),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'Generate PIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Gilroy'),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
