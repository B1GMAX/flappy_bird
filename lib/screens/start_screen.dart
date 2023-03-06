import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../utils/constants.dart';
import 'category_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/ua.JPG',
            width: 330,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, bottom: 10),
            child: Text(
              AppLocalizations.of(context).allMoneys,
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 270),
            child: Text(AppLocalizations.of(context).usePhone,
                style: const TextStyle(fontSize: 22),
                textAlign: TextAlign.center),
          ),
          Container(
            height: sizeHeight(context),
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CateGoryScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context).start,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
