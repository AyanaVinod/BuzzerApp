import 'dart:core';
import 'package:flutter/material.dart';
import 'package:buzzerapp/Colors/colors.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.6],
              colors: [
                gradient1,
                gradient2,
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset('assets/images/ic_pattern_top.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft),
              ),
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/ic_Logo_Quiztime.png',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Image.asset('assets/images/ic_pattern_bottom.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
