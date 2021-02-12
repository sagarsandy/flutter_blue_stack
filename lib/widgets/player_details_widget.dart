import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/models/player.dart';
import 'package:flutter_blue_stack/widgets/player_info_widget.dart';
import 'package:flutter_blue_stack/widgets/player_stats_widget.dart';

class PlayerDetailsWidget extends StatelessWidget {
  final Player player;

  PlayerDetailsWidget({this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Column(
        children: [
          PlayerInfoWidget(
            profilePhoto: player.image,
            name: player.name,
            points: player.points,
          ),
          PlayerStatsWidget(
            played: player.played,
            won: player.won,
            winPercentage: player.winPercentage,
          ),
        ],
      ),
    );
  }
}
