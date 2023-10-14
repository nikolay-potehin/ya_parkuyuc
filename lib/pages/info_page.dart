import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya_parkuyuc/src/providers/hack_provider.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: const SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SafeArea(
          child: Column(
            children: [
              _AppInfo(),
              _HackSwitch(),
              Divider(),
            ],
          ),
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
}

class _HackSwitch extends StatefulWidget {
  const _HackSwitch();

  @override
  State<_HackSwitch> createState() => _HackSwitchState();
}

class _HackSwitchState extends State<_HackSwitch> {
  @override
  Widget build(BuildContext context) {
    final hackProvider = context.read<HackProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Включить взлом', style: TextStyle(fontSize: 17)),
        Switch(
          value: hackProvider.isHacked,
          onChanged: (value) => setState(() {
            hackProvider.isHacked = value;
          }),
        ),
      ],
    );
  }
}

class _AppInfo extends StatelessWidget {
  const _AppInfo();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ЯПаркуюсь!',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text(
          'О приложении',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Text(
          'ооо повезло повезло. мы разработали новое приложение которое позволяет находить свободные парковочные места\n\nemail: business@hackers.net\ntg: @werehackers\nskype: xXx_CooL_H4cx3rZ_xXx',
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(height: 16),
        Text(
          'Настройки',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
