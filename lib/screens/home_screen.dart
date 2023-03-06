import 'package:flappy_bird/l10n/l10n.dart';
import 'package:flappy_bird/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provide.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/ua.JPG',
            width: 310,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'CHOOSE LANGUAGE',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            height: sizeHeight(context),
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
            child: ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(L10n.all[0]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StartScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Українська',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: sizeHeight(context),
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
            child: ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(L10n.all[1]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StartScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Англійська',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }
}
