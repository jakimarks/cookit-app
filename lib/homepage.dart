import 'package:flutter/material.dart';
import 'package:my_app/recipe_list.dart';
import 'package:my_app/scan.dart';

String qrResultInitialValue = "Not yet scanned";

ButtonStyle flatButtonStyle = TextButton.styleFrom(
  shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.green, width: 3.0),
      borderRadius: BorderRadius.circular(20.0)),
  padding: const EdgeInsets.all(15.0),
);

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? qrResult = qrResultInitialValue;

  Future<void> _navigateAndUpdateScanResult(BuildContext context) async {
    final code = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Scan()),
    );
    updateScanResult(code);
  }

  void updateScanResult(String? code) {
    setState(() {
      qrResult = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cookit!"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "RECIPE",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrResult!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              style: flatButtonStyle,
              onPressed: () {
                _navigateAndUpdateScanResult(context);
              },
              child: const Text(
                "Scan QR Code",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              style: flatButtonStyle,
              onPressed: () {
                updateScanResult(qrResultInitialValue);
              },
              child: const Text(
                "Reset",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextButton(
              style: flatButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecipeList()),
                );
              },
              child: const Text(
                "Recipe list",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
