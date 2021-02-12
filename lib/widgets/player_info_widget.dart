import 'package:flutter/material.dart';

class PlayerInfoWidget extends StatelessWidget {
  final String profilePhoto;
  final String name;
  final String points;

  PlayerInfoWidget({this.profilePhoto, this.name, this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Row(
        children: [
          // Rendering player profile avatar
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(profilePhoto),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Rendering player name
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Rendering player rating points
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    // color: Colors.white,
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 1.5,
                    ),
                  ),
                  height: 50,
                  // width: 230,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8, right: 50),
                    child: RichText(
                      text: TextSpan(
                        text: points,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: ' Elo rating',
                            style: TextStyle(
                              textBaseline: TextBaseline.ideographic,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
