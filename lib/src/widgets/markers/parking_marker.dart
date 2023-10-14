import 'package:flutter/material.dart';

class ParkingMarker extends StatelessWidget {
  const ParkingMarker({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color.fromRGBO(255, 45, 85, 1),
            child: Icon(Icons.drive_eta, color: Colors.white),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
