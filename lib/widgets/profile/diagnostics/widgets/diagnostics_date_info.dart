import 'package:flutter/material.dart';

class DiagnosticsDateInfo extends StatelessWidget {
  final String date;

  const DiagnosticsDateInfo({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: const TextStyle(
        fontFamily: 'ObjectSans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF7B878E),
      ),
    );
  }
}