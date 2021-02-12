import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/widgets/player_stats_text_widget.dart';

class PlayerStatsWidget extends StatelessWidget {
  final String played;
  final String won;
  final String winPercentage;

  PlayerStatsWidget({this.played, this.won, this.winPercentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        // color: Colors.cyan,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0XFFE47B03),
                    Color(0XFFE78900),
                    Color(0XFFECA601),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(27),
                    topLeft: Radius.circular(27)),
              ),
              child: PlayerStatsTextWidget(
                statsName: "Tournaments played",
                statsNumber: played,
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0XFF4D279B),
                    Color(0XFF8545B1),
                    Color(0XFFA254BD),
                  ],
                ),
              ),
              child: PlayerStatsTextWidget(
                statsName: "Tournaments won",
                statsNumber: won,
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0XFFec5646),
                    Color(0XFFee6a4a),
                    Color(0XFFef7e4e),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(27),
                    topRight: Radius.circular(27)),
              ),
              child: PlayerStatsTextWidget(
                statsName: "Winning percentage",
                statsNumber: winPercentage + "%",
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
