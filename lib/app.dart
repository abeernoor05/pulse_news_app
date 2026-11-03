import 'package:flutter/material.dart';

class PulseApp extends StatelessWidget {
  const PulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pulse',
      home: Scaffold(body: Center(child: Text('Pulse'))),
    );
  }
}