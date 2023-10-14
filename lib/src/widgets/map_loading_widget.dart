import 'package:flutter/material.dart';

class MapLoadingWidget extends StatelessWidget {
  const MapLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text(
            'Карта уже загружается',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
