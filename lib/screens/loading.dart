import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child:
            SpinKitDualRing(
              color: Colors.blueAccent,
              size: 80,
            ),
        ),
    );
  }
}