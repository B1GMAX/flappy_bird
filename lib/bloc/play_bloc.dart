import 'dart:async';

import 'package:flappy_bird/utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PlayBloc {
  final _birdYController = BehaviorSubject<double>();
  final _isGameStartedController = BehaviorSubject<bool>();
  final _barrierXController = BehaviorSubject<List<double>>();
  final _counterController = BehaviorSubject<int>();
  final _bestScoreController = BehaviorSubject<int>();

  Stream<int> get bestScoreStream => _bestScoreController.stream;

  Stream<int> get counterStream => _counterController.stream;

  Stream<List<double>> get barrierXStream => _barrierXController.stream;

  Stream<double> get birdYStream => _birdYController.stream;

  Stream<bool> get isGameStartedStream => _isGameStartedController.stream;

  static double _birdY = 0;
  double _height = 0;
  double _time = 0;
  final double _gravity = -4.9;
  final double _velocity = 3.5;
  double _initialPosition = _birdY;
  double birdWidth = 0.1;
  double birdHeight = 0.1;

  bool isGameStarted = false;

  List<double> barrierX = [2.0, 2 + 1.5, 5.0, 6.5];
  double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.6],
    [0.65, 0.35],
    [0.35, 0.65],
  ];

  int counter = 0;
  int bestScore = 0;

  PlayBloc() {
    _getBestScoreFromPreference();
  }

  void startGame(BuildContext context) {
    _isGameStartedController.add(isGameStarted = true);
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      _height = _gravity * _time * _time + _velocity * _time;
      _birdYController.add(_birdY = _initialPosition - _height);

      if (_birdIsDead()) {
        timer.cancel();
        _showDeadDialog(context);
      }
      _moveMap();
      _time += 0.01;
    });
  }

  void jump() {
    _time = 0;

    _initialPosition = _birdY;
  }

  bool _birdIsDead() {
    if (_birdY < -1 || _birdY > 1) {
      return true;
    }

    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          barrierX[i] + barrierWidth >= -birdWidth &&
          (_birdY <= -1 + barrierHeight[i][0] ||
              _birdY + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }
    return false;
  }

  void _resetGame(BuildContext context) {
    Navigator.pop(context);
    _birdYController.add(_birdY = 0);
    _isGameStartedController.add(isGameStarted = false);
    _time = 0;
    _initialPosition = _birdY;
    _barrierXController.add(barrierX = [2.0, 2 + 1.5, 5.0, 6.5]);
    _counterController.add(counter = 0);
  }

  void _showDeadDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: const Center(
              child: Text(
                'G A M E  O V E R',
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  _setBestScore();
                  _resetGame(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    color: Colors.white,
                    child: const Text(
                      'PLAY AGAIN',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _moveMap() {
    const step = 0.005;
    for (int i = 0; i < barrierX.length; i++) {
      barrierX[i] -= step;

      if (barrierX[i] < -1.5) {
        barrierX[i] += 4.5;
      }

      if (barrierX[i] < 0 && barrierX[i] >= 0 - step) {
        counter = counter + 1;
      }
    }
    _barrierXController.add(barrierX);
    _counterController.add(counter);
  }

  void _setBestScore() {
    if (counter > bestScore) {
      bestScore = counter;
    }
    Preference.saveBestScore(bestScore);
    _bestScoreController.add(bestScore);
  }

  void _getBestScoreFromPreference() async {
    bestScore = await Preference.readBestScore();
    _bestScoreController.add(bestScore);
  }

  void dispose() {
    _birdYController.close();
    _isGameStartedController.close();
    _barrierXController.close();
    _counterController.close();
    _bestScoreController.close();
  }
}
