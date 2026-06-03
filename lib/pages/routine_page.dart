import 'package:flutter/material.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({super.key});

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  final PageController morningController = PageController();
  final PageController nightController = PageController();
  final PageController weeklyController = PageController();

  int morningIndex = 0;
  int nightIndex = 0;
  int weeklyIndex = 0;

  @override
  void dispose() {
    morningController.dispose();
    nightController.dispose();
    weeklyController.dispose();
    super.dispose();
  }

  Widget buildIndicator(int current, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: current == index ? 12 : 8,
          height: current == index ? 12 : 8,
          decoration: BoxDecoration(
            color: current == index ? Colors.pink : Colors.pink.shade100,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget routineCard({
    required String image,
    required String title,
    required int step,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.pink.shade200,
                  width: 3,
                ),
              ),
              child: ClipOval(
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: -5,
              left: -5,
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "$step",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget buildSection({
    required String title,
    required PageController controller,
    required List<Map<String, dynamic>> items,
    required int currentIndex,
    required Function(int) onPageChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.shade50,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          const SizedBox(height: 20),

          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: controller,
              itemCount: items.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                return routineCard(
                  image: items[index]["image"],
                  title: items[index]["title"],
                  step: items[index]["step"],
                );
              },
            ),
          ),

          const SizedBox(height: 10),
          buildIndicator(currentIndex, items.length),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final morningRoutine = [
      {"image": "assets/cleancer.jpg", "title": "Cleanser", "step": 1},
      {"image": "assets/toner.jpg", "title": "Toner", "step": 2},
      {"image": "assets/serum.jpg", "title": "Serum", "step": 3},
      {"image": "assets/moisturizer.jpg", "title": "Moisturizer", "step": 4},
      {"image": "assets/sunscreen.jpg", "title": "Sunscreen", "step": 5},
    ];

    final nightRoutine = [
      {"image": "assets/remover.jpg", "title": "Makeup Remover", "step": 1},
      {"image": "assets/cleanser2.jpg", "title": "Cleanser", "step": 2},
      {"image": "assets/toner2.jpg", "title": "Toner", "step": 3},
      {"image": "assets/serum2.jpg", "title": "Serum", "step": 4},
      {"image": "assets/moisturizer2.jpg", "title": "Moisturizer", "step": 5},
    ];

    final weeklyRoutine = [
      {"image": "assets/exfoliator.jpg", "title": "Exfoliator", "step": 1},
      {"image": "assets/mask.jpg", "title": "Mask", "step": 2},
      {"image": "assets/moisturizer3.jpg", "title": "Moisturizer", "step": 3},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Skincare Routine"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.pink,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            buildSection(
              title: "🌞 Morning Routine",
              controller: morningController,
              items: morningRoutine,
              currentIndex: morningIndex,
              onPageChanged: (index) {
                setState(() => morningIndex = index);
              },
            ),
            buildSection(
              title: "🌙 Night Routine",
              controller: nightController,
              items: nightRoutine,
              currentIndex: nightIndex,
              onPageChanged: (index) {
                setState(() => nightIndex = index);
              },
            ),
            buildSection(
              title: "💆‍♀️ Weekly Care",
              controller: weeklyController,
              items: weeklyRoutine,
              currentIndex: weeklyIndex,
              onPageChanged: (index) {
                setState(() => weeklyIndex = index);
              },
            ),
          ],
        ),
      ),
    );
  }
}