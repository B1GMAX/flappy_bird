import 'package:flutter/cupertino.dart';

class MyBird extends StatelessWidget {
  final double birdY;
  final double birdWidth;
  final double birdHeight;

  const MyBird(
      {required this.birdY,
      required this.birdHeight,
      required this.birdWidth,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, birdY),
      child: Image.asset(
        'assets/flappy_bird.png',
        width: MediaQuery.of(context).size.height * birdWidth * 1.3,
        height: MediaQuery.of(context).size.height * 2 * birdHeight / 1.5,
        fit: BoxFit.fill,
      ),
    );
  }
}
