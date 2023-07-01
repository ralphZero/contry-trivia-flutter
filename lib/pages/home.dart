import 'package:country_quiz/mocks/home_cms.dart';
import 'package:country_quiz/pages/wrapper.dart';
import 'package:country_quiz/widgets/home/cta_group.dart';
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
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const Wrapper(),
        ),
      );
    }

    void handleOpenLeaderboard() {
      // print('Open Leaderboard');
      // TODO: Go to leaderboard page
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
              CallToActions(
                cms: homeCMS,
                handlePlay: handlePlay,
                handleOpenLeaderboard: handleOpenLeaderboard,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
