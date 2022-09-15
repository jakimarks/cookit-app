import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

typedef StringCallback = void Function(String? code);

class Scan extends StatelessWidget {
  final Function(String?) onDetect;

  const Scan({super.key, required this.onDetect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              MobileScanner(
                fit: BoxFit.contain,
                onDetect: (code, _) {
                  onDetect(code.rawValue);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
