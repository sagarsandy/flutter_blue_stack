import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 17,
            child: Divider(
              height: 3,
              thickness: 3.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 9),
          Container(
            width: 30,
            child: Divider(
              height: 3,
              thickness: 3.0,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
