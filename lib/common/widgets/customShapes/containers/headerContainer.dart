import 'package:flutter/material.dart';

import '../curvedEdges/curvedEdgesWidget.dart';
import 'circularContainer.dart';

class HeaderContainer extends StatelessWidget {
  final Widget child;
  const HeaderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        color: Colors.deepPurple,
        // child: SizedBox(
        //   height: 400,
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -250,
                  child: CircularContainer(
                    bgColor: Colors.white.withOpacity(0.1),
                  )),
              Positioned(
                  top: 100,
                  right: -300,
                  child: CircularContainer(
                    bgColor: Colors.white.withOpacity(0.1),
                  )),
              child,
            ],
          ),
        // ),
      ),
    );
  }
}
