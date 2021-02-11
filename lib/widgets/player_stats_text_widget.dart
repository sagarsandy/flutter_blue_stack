import 'package:flutter/material.dart';

class PlayerStatsTextWidget extends StatelessWidget {
  final String statsName;
  final String statsNumber;

  PlayerStatsTextWidget({this.statsName, this.statsNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          statsNumber,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          statsName,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
