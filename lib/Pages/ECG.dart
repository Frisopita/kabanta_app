//ECG Page

import 'package:flutter/material.dart';

class ECG extends StatefulWidget {
  const ECG({super.key});

  @override
  State<ECG> createState() => _ECGState();
}

class _ECGState extends State<ECG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ECG'),
      ),
      body: const Center(
        child: Text('ECG'),
      )
    );
  }
}