import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/widgets/player_stats_text_widget.dart';

class PlayerStatsWidget extends StatelessWidget {
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
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(27),
                    topLeft: Radius.circular(27)),
              ),
              child: PlayerStatsTextWidget(
                statsName: "Tournaments played",
                statsNumber: "34",
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.purple,
              child: PlayerStatsTextWidget(
                statsName: "Tournaments won",
                statsNumber: "09",
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(27),
                    topRight: Radius.circular(27)),
              ),
              child: PlayerStatsTextWidget(
                statsName: "Winning percentage",
                statsNumber: "26%",
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
