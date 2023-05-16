import 'package:flutter/cupertino.dart';

import '../../ListViews/PlayerListviewAnimation.dart';

class PlayersListviewTextAnimation extends StatefulWidget {
  const PlayersListviewTextAnimation({super.key});

  @override
  _PlayersListviewTextAnimation createState() => _PlayersListviewTextAnimation();
}

class _PlayersListviewTextAnimation extends State<PlayersListviewTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _fabAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
         AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fabAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _fabAnimation.value,
      child: PlayerListViewAnimation(),
    );
  }
}