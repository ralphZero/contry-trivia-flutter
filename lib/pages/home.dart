import 'package:country_quiz/mocks/home_cms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenPaddingTop = MediaQuery.of(context).size.height * 0.15;
    var screenPaddingBottom = MediaQuery.of(context).size.height * 0.08;

    var homeCMS = HomeCMS();

    void handlePlay() {
      print('this is a test');
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            bottom: screenPaddingBottom,
            top: screenPaddingTop,
          ),
          width: screenWidth,
          decoration: const BoxDecoration(
            gradient: pageGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                homeCMS.title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tertiary,
                      fixedSize: const Size.fromWidth(200.0),
                      textStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () => handlePlay(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        homeCMS.playCta,
                        style: const TextStyle(
                          color: accentText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: leadearBoardBtnColor,
                      fixedSize: const Size.fromWidth(200.0),
                      textStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () => handlePlay(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(homeCMS.leaderboardCta),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
