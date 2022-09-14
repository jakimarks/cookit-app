import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

typedef StringCallback = void Function(String? code);

class Scan extends StatelessWidget {
  const Scan({super.key});

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
                onDetect: (code, args) {
                  Navigator.pop(context, code.rawValue);
                },
                //    this.code = code.rawValue;
              ),
            ],
          );
        },
      ),
    );
  }
}
