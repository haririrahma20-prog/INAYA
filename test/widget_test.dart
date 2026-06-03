import 'package:flutter/material.dart';

void main() {
  runApp(const InayaApp());
}

class InayaApp extends StatelessWidget {
  const InayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inaya',
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // الخلفية الصورة
            Positioned.fill(
              child: Image.asset(
                'assets/images/yousra.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // زر Commencer
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    // هنا تضيفي الصفحة الثانية
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                  child: const Text(
                    "Commencer",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}