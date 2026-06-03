import 'package:flutter/material.dart';
import 'routine_page.dart';

class SkinQuestionPage extends StatelessWidget {
  const SkinQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFE91E63)),
        title: const Text(
          "Skin",
          style: TextStyle(
            color: Color(0xFFE91E63),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "Do you know your skin type?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "اختاري نعم إذا كنتِ تعرفين نوع بشرتك أو لا إذا تريدين معرفة ذلك",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 40),

              // ===== YES BUTTON =====
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  
 
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RoutinePage(),
        ),
      );
    },
    child: const Text(
      "YES",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
),
              const SizedBox(height: 15),

              // ===== NO BUTTON =====
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE91E63)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "NO",
                    style: TextStyle(
                      color: Color(0xFFE91E63),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}