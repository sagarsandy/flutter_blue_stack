import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/widgets/player_info_widget.dart';
import 'package:flutter_blue_stack/widgets/player_stats_widget.dart';

class Bingo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rendering player info widget
          PlayerInfoWidget(),
          // Sized box for space between player info and player stats
          SizedBox(height: 8),
          // Rendering player game stats widget
          PlayerStatsWidget(),

          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 5, bottom: 10),
            child: Text(
              "Recommended for you",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 9.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.black,
                    child: Container(
                      height: 180,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width - 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              child: Image.network(
                                "https://newevolutiondesigns.com/images/freebies/abstract-facebook-cover-4.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            height: 35,
                            child: Text("Hello world"),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
