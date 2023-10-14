import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya_parkuyuc/src/providers/hack_provider.dart';

class ParkingLot extends StatefulWidget {
  const ParkingLot({
    super.key,
    this.isFree = false,
  });

  final bool isFree;

  @override
  State<ParkingLot> createState() => _ParkingLotState();
}

class _ParkingLotState extends State<ParkingLot> {
  late bool isFree = widget.isFree;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.read<HackProvider>().isHacked) {
          setState(() {
            isFree = !isFree;
          });
        }
      },
      child: Container(
        width: 25,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: isFree
              ? const Color.fromRGBO(52, 199, 89, 1)
              : const Color.fromRGBO(142, 142, 147, 1),
        ),
      ),
    );
  }
}
