import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya_parkuyuc/src/providers/hack_provider.dart';
import 'package:ya_parkuyuc/src/widgets/my_box.dart';
import 'package:ya_parkuyuc/src/widgets/parking_lot.dart';

class ParkingPage extends StatelessWidget {
  const ParkingPage({
    super.key,
    required this.parkingName,
  });

  final String parkingName;
  final int parkingLotsAmount = 33;
  final int freeLotEveryNLots = 8;

  @override
  Widget build(BuildContext context) {
    bool isHacked = context.read<HackProvider>().isHacked;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Парковка', style: TextStyle(fontSize: 28)),
            Text(
              parkingName,
              style: const TextStyle(fontSize: 28, color: Colors.blue),
            ),
            const Divider(color: Colors.blue, thickness: 3, height: 20),
            const SizedBox(height: 10),
            MyBox(
              width: double.infinity,
              height: 50,
              child: Text(
                  isHacked
                      ? 'Взлом включен!'
                      : 'Свободно ${getFreeLotsAmount()} мест',
                  style: const TextStyle(fontSize: 17)),
            ),
            const SizedBox(height: 16),
            MyBox(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Wrap(
                spacing: 5,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < parkingLotsAmount; i++)
                    ParkingLot(
                      isFree: i % freeLotEveryNLots == 0,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leadingWidth: 72,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.blue,
          size: 30,
        ),
      ),
    );
  }

  int getFreeLotsAmount() => ((parkingLotsAmount - 1) ~/ freeLotEveryNLots) + 1;
}
