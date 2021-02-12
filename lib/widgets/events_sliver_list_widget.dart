import 'package:flutter/material.dart';
import 'package:flutter_blue_stack/models/tournament.dart';

class EventsSliverListWidget extends StatelessWidget {
  final List<Tournament> tournamentsData;

  EventsSliverListWidget(this.tournamentsData);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.black54,
            child: Container(
              height: 170,
              child: Column(
                children: [
                  // Rendering tournament cover image
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      child: Image.network(
                        tournamentsData[index].coverUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Rendering tournament name
                              Container(
                                width: MediaQuery.of(context).size.width - 120,
                                child: Text(
                                  tournamentsData[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(height: 7),
                              // Rendering tournament game name
                              Container(
                                width: MediaQuery.of(context).size.width - 120,
                                child: Text(
                                  tournamentsData[index].gameName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_sharp,
                          size: 35,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }, childCount: tournamentsData.length),
    );
  }
}
