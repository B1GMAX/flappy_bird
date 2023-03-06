import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/play_bloc.dart';
import '../widget/my_barrier.dart';
import '../widget/my_bird.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<PlayBloc>(
      create: (context) => PlayBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      builder: (context, _) {
        return StreamBuilder<bool>(
            initialData: false,
            stream: context.read<PlayBloc>().isGameStartedStream,
            builder: (context, isGameStartedSnapshot) {
              return GestureDetector(
                onTap: () {
                  isGameStartedSnapshot.data!
                      ? context.read<PlayBloc>().jump()
                      : context.read<PlayBloc>().startGame(context);
                },
                child: Scaffold(
                  body: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.blue,
                          child: Stack(
                            children: [
                              StreamBuilder<double>(
                                  initialData: 0,
                                  stream: context.read<PlayBloc>().birdYStream,
                                  builder: (context, birdYSnapshot) {
                                    return MyBird(
                                      birdY: birdYSnapshot.data!,
                                      birdHeight:
                                          context.read<PlayBloc>().birdHeight,
                                      birdWidth:
                                          context.read<PlayBloc>().birdWidth,
                                    );
                                  }),
                              Container(
                                alignment: const Alignment(0, -0.5),
                                child: Text(
                                  isGameStartedSnapshot.data!
                                      ? ''
                                      : 'T A P  T O  P L A Y',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              StreamBuilder<List<double>>(
                                  initialData: const [2.0, 2 + 1.5, 5.0, 6.5],
                                  stream:
                                      context.read<PlayBloc>().barrierXStream,
                                  builder: (context, snapshot) {
                                    return MyBarrier(
                                      barrierX: snapshot.data![0],
                                      barrierWidth:
                                          context.read<PlayBloc>().barrierWidth,
                                      barrierHeight: context
                                          .read<PlayBloc>()
                                          .barrierHeight[0][0],
                                      isThisBottomBarrier: false,
                                    );
                                  }),
                              StreamBuilder<List<double>>(
                                  initialData: const [2.0, 2 + 1.5, 5.0, 6.5],
                                  stream:
                                      context.read<PlayBloc>().barrierXStream,
                                  builder: (context, snapshot) {
                                    return MyBarrier(
                                      barrierX: snapshot.data![0],
                                      barrierWidth:
                                          context.read<PlayBloc>().barrierWidth,
                                      barrierHeight: context
                                          .read<PlayBloc>()
                                          .barrierHeight[0][1],
                                      isThisBottomBarrier: true,
                                    );
                                  }),
                              StreamBuilder<List<double>>(
                                  initialData: const [2.0, 2 + 1.5, 5.0, 6.5],
                                  stream:
                                      context.read<PlayBloc>().barrierXStream,
                                  builder: (context, barrierXTwoSnapshot) {
                                    return MyBarrier(
                                      barrierX: barrierXTwoSnapshot.data![1],
                                      barrierWidth:
                                          context.read<PlayBloc>().barrierWidth,
                                      barrierHeight: context
                                          .read<PlayBloc>()
                                          .barrierHeight[1][0],
                                      isThisBottomBarrier: false,
                                    );
                                  }),
                              StreamBuilder<List<double>>(
                                  initialData: const [2.0, 2 + 1.5, 5.0, 6.5],
                                  stream:
                                      context.read<PlayBloc>().barrierXStream,
                                  builder: (context, barrierXTwoSnapshot) {
                                    return MyBarrier(
                                      barrierX: barrierXTwoSnapshot.data![1],
                                      barrierWidth:
                                          context.read<PlayBloc>().barrierWidth,
                                      barrierHeight: context
                                          .read<PlayBloc>()
                                          .barrierHeight[1][1],
                                      isThisBottomBarrier: true,
                                    );
                                  }),
                              StreamBuilder<List<double>>(
                                  initialData: const [2.0, 2 + 1.5, 5.0, 6.5],
                                  stream:
                                      context.read<PlayBloc>().barrierXStream,
                                  builder: (context, barrierXTwoSnapshot) {
                                    return MyBarrier(
                                      barrierX: barrierXTwoSnapshot.data![2],
                                      barrierWidth:
                                          context.read<PlayBloc>().barrierWidth,
                                      barrierHeight: context
                                          .read<PlayBloc>()
                                          .barrierHeight[2][0],
                                      isThisBottomBarrier: false,
                                    );
                                  }),
                              StreamBuilder<List<double>>(
                                  initialData: const [2.0, 2 + 1.5, 5.0, 6.5],
                                  stream:
                                      context.read<PlayBloc>().barrierXStream,
                                  builder: (context, barrierXTwoSnapshot) {
                                    return MyBarrier(
                                      barrierX: barrierXTwoSnapshot.data![2],
                                      barrierWidth:
                                          context.read<PlayBloc>().barrierWidth,
                                      barrierHeight: context
                                          .read<PlayBloc>()
                                          .barrierHeight[2][1],
                                      isThisBottomBarrier: true,
                                    );
                                  })
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        height: 15,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.brown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Score',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  StreamBuilder<int>(
                                      initialData: 0,
                                      stream: context
                                          .read<PlayBloc>()
                                          .counterStream,
                                      builder: (context, counterSnapshot) {
                                        return Text(
                                          counterSnapshot.data!.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        );
                                      }),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Best',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  StreamBuilder<int>(
                                      initialData: 0,
                                      stream: context
                                          .read<PlayBloc>()
                                          .bestScoreStream,
                                      builder: (context, bestScoreSnapshot) {
                                        return Text(
                                          bestScoreSnapshot.data!.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        );
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
