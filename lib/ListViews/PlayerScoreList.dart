import 'package:buzzerapp/Colors/colors.dart';
import 'package:buzzerapp/models/Players.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerScoreList extends StatefulWidget {
  PlayerScoreList({super.key});
  @override
  _PlayerScoreList createState() => _PlayerScoreList();
}

class _PlayerScoreList extends State<PlayerScoreList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: players.length,
          itemBuilder: (context,index){
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(players[index].name ,style: (const TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w500)),),

                  Container(

                    child: Padding(
                     padding: EdgeInsets.only(left: 60.0),
                    child: const Text(
                      '12',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 100.0),
                    child:
                    Image.asset(
                      'assets/images/ic_model.png', // Replace with your image path
                      width: 20, // Set the desired width of the image
                      height: 20, // Set the desired height of the image
                      fit: BoxFit.cover, // Set the desired fit property of the image
                    ),
                  ),
                )],
              ),
            );
          }
      ),
    );
  }

}