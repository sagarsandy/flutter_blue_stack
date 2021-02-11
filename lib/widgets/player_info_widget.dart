import 'package:flutter/material.dart';

class PlayerInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Row(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
                "https://content.api.news/v3/images/bin/8f80463ecf60f40771dbbcc51aa4c789"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Simon Baker",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
                        text: '2250 ',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Elo rating',
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
