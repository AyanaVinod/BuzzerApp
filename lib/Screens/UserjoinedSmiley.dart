import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Animations/Masters/PlayerAnimationFirstPosition.dart';
import '../Colors/colors.dart';
import '../SocketIO/services/socket_demo.dart';
import 'CurrentSession.dart';

class UserJoinedSmiley extends StatefulWidget {
  const UserJoinedSmiley({super.key});
  @override
  _UserJoinedSmileyState createState() => _UserJoinedSmileyState();
}

class _UserJoinedSmileyState extends State<UserJoinedSmiley> {
  @override
  Widget build(BuildContext context) {
    SocketService.init();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),

        child: Column(children: <Widget>[
          SizedBox(
              child: StreamBuilder(
            stream: SocketService.messageStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(child: LinearProgressIndicator());
              }

              if (snapshot.data == null) {
                return const SizedBox();
              }
              return Row(
                children: (snapshot.data ?? [])
                    .map((e) => ListView(shrinkWrap: true, children: [Text(e)]))
                    .toList(),
              );
            },
          ))
        ]));
  }
}
