import 'package:flutter/material.dart';

class MyUserLocationMarker extends StatelessWidget {
  const MyUserLocationMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: const Color.fromRGBO(0, 122, 255, 0.2),
        child: Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
            child: Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 122, 255, 1),
                borderRadius: BorderRadius.circular(19),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
