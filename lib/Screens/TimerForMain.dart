import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class TimerMain extends StatefulWidget {
  TimerMain({super.key});
  @override
  _TimerMainState createState() => _TimerMainState();
}

class _TimerMainState extends State<TimerMain> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: gamePopColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[

              Container(
                  alignment: Alignment.topCenter,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/ic_pattern_top.png',
                        width: 600,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        child: const Text(
                          'timer will ends in',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        child: const Text('24 Sec',style: TextStyle(fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 53,
                            color:textYellow),),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        child:    ElevatedButton(
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
                            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 30),
                            child: Text(
                              'Scored',
                              style: TextStyle(fontSize: 16,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        child:   ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            elevation: 2, // customize the elevation value
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              // customize the border radius
                              side: BorderSide(color: Colors.white, width: 1,), // customize the border color and width
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 30),
                            child: Text(
                              'Oh no!',
                              style: TextStyle(fontSize: 16,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


//Widget _firstContainer(BuildContext context) {

//}
