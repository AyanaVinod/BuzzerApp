import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class ExitPopUp extends StatefulWidget {
  const ExitPopUp({super.key});
  @override
  _ExitPopUpState createState() => _ExitPopUpState();
}

class _ExitPopUpState extends State<ExitPopUp> with SingleTickerProviderStateMixin {

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
              const Text(
                'Do you want to exit/',
                style: TextStyle(
                    color: white,
                    fontFamily: 'Gilroy',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'finish game ?',
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
Container(
  padding: EdgeInsets.only(left: 5,right: 5),
              child: Text(
                'once you confirm, the leading player will be declared as a winner',
                style: TextStyle(
                    color: textYellow,
                    fontFamily: 'Gilroy',
                    fontSize: 9,
                    fontWeight: FontWeight.w500),

              ),
),
              const SizedBox(
                height: 20,
              ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                backgroundColor: gamePopColor,
                elevation: 2, // customize the elevation value
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  // customize the border radius
                  side: BorderSide(color: Colors.white, width: 1,), // customize the border color and width
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: Text(
                  'NO',
                  style: TextStyle(fontSize: 16,),
                ),
              ),
            ),

            const SizedBox(width:40),

             ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 2, // customize the elevation value
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    // customize the border radius
                    side: BorderSide(color: Colors.white, width: 1,), // customize the border color and width
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                  child: Text(
                    'Yes',
                    style: TextStyle(fontSize: 16,),
                  ),
                ),
              )]
          )
        ])
      )));
  }
}
