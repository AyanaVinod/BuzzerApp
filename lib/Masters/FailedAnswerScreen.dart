import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class FailedAnswerScreen extends StatefulWidget {
  FailedAnswerScreen({super.key});
  @override
  _FailedAnswerScreen createState() => _FailedAnswerScreen();
}

class _FailedAnswerScreen extends State<FailedAnswerScreen>
    with TickerProviderStateMixin{
  late AnimationController controller;


  void initState()
  {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 4));
    animation:CurvedAnimation(parent: controller,curve: Curves.easeIn);
    controller.repeat();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: gamePopColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              //_firstContainer(context),
              Container(
                  alignment: Alignment.topCenter,
                  // transform: Matrix4.translationValues(0, -200, 0),
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
                          'Oh Sorry!',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        child: const Text('Wait for your next turn',style: TextStyle(fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color:Colors.white),),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        child:RotationTransition(turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                          child:SizedBox(height:200,width:200,
                            child:
                            Image.asset('assets/images/ic_Snowflake.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        child: Text('wait for a few secs',style: TextStyle(fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: textYellow),),
                      )
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
