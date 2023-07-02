import 'package:flutter/material.dart';

class QuestionFlag extends StatelessWidget {
  final String flagUrl;
  final bool hasFlag;

  const QuestionFlag({
    super.key,
    required this.flagUrl,
    required this.hasFlag,
  });

  @override
  Widget build(BuildContext context) {
    return hasFlag
        ? Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    flagUrl,
                    width: 120.0,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
