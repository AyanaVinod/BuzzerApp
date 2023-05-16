import 'package:flutter/material.dart';

import '../Colors/colors.dart';
import '../Masters/OnePointScored.dart';

class VerifyPopUp extends StatefulWidget {
  const VerifyPopUp({super.key});
  @override
  _VerifyPopUpState createState() => _VerifyPopUpState();
}

class _VerifyPopUpState extends State<VerifyPopUp>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: Scaffold(
            backgroundColor: gamePopColor,
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  // const Text(
                  //   'Addantatian',
                  //   style: TextStyle(
                  //       color:  textYellow,
                  //       fontFamily: 'Gilroy',
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  const Text(
                    'Claimimg for 1 point',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: white,
                        fontFamily: 'Gilroy',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'once you verify the score will be added to the point table',
                    style: TextStyle(
                        color: textYellow,
                        fontFamily: 'Gilroy',
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gamePopColor,
                        elevation: 2, // customize the elevation value
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          // customize the border radius
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ), // customize the border color and width
                        ),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        child: Text(
                          'Decline',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: () => {
                      Navigator.push(
                       context, MaterialPageRoute(builder: (context) => OnePointScored())),
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 2, // customize the elevation value
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          // customize the border radius
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ), // customize the border color and width
                        ),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                        child: Text(
                          'Verify Score',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ])
                ]))));
  }
}
