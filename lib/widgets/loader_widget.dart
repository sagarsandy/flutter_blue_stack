import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class LoaderWidget extends StatelessWidget {
  final String loadingText;
  LoaderWidget(this.loadingText);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          height: 100,
          child: ScalingText(
            loadingText,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
