import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget{ 

    final double width;
    final double height;
    final Widget child;
    final Color colour;

    const CustomContainer (this.width, this.height, this.child, this.colour, {super.key});

@override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
        );
  }
}