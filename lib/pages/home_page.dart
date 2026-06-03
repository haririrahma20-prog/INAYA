
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '/pages/login_page.dart';
import 'skin_question_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String username = "";


  List products = [];

  @override
  void initState() {
    super.initState();
    loadUser();
    getProducts();
  }
  Future loadUser() async {

  final prefs =
      await SharedPreferences.getInstance();

  setState(() {

    username =
        prefs.getString('username') ?? '';

 

  });
}

  Future getProducts() async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://192.168.1.40:3000/products",
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),

      body: currentIndex == 0
          ? SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    const _HomeHeader(),

                    const _SearchBar(),

                    const SizedBox(height: 10),

                    const _CategoriesSection(),

                    const SizedBox(height: 18),

                    _ProductSection(
                      products: products,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
         : SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [

        const SizedBox(height: 20),

        // USER CARD
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFE91E63), Color(0xFFFF80AB)],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.person,
                    size: 40, color: Color(0xFFE91E63)),
              ),
              const SizedBox(height: 10),
              Text(
                username,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              
            ],
          ),
        ),
const SizedBox(height: 25),

Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  child: Column(
    children: [
      ListTile(
        leading: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        title: const Text("Favorite"),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: () {},
      ),

      const Divider(height: 1),

      ListTile(
        leading: const Icon(
          Icons.shopping_cart,
          color: Colors.green,
        ),
        title: const Text("Cart"),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: () {},
      ),

      const Divider(height: 1),

      ListTile(
        leading: const Icon(
          Icons.language,
          color: Colors.blue,
        ),
        title: const Text("Language"),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: () {},
      ),
    ],
  ),
),

const SizedBox(height: 20),

ListTile(
  leading: const Icon(Icons.logout),
  title: const Text("Logout"),
  onTap: () async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
      (route) => false,
    );
  },
),
        
      ],
    ),
  ),
),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        selectedItemColor:
            const Color(0xFFE91E63),

        unselectedItemColor: Colors.grey,

        elevation: 10,

        backgroundColor: Colors.white,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

/* ================= HEADER ================= */

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  gradient: const LinearGradient(
                    colors: [
                      Color(0xfff8a5d8),
                      Color(0xffffd6f2),
                    ],
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent
                          .withValues(alpha: 0.20),

                      blurRadius: 16,

                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: const Icon(
                  Icons.spa,
                  color: Colors.white,
                  size: 22,
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                "INAYA",

                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Color(0xFFE91E63),
                ),
              ),
            ],
          ),

          const Row(
            children: [
              _SmallIcon(
                icon: Icons.notifications_none,
              ),

              SizedBox(width: 12),

              _SmallIcon(
                icon: Icons.favorite_border,
                color: Colors.pink,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* ================= SEARCH BAR ================= */

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 18,
      ),

      child: Container(
        height: 52,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withValues(alpha: 0.04),

              blurRadius: 18,

              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: const TextField(
          decoration: InputDecoration(
            hintText:
                "Search skincare, makeup...",

            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),

            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFFE91E63),
            ),

            suffixIcon: Icon(
              Icons.tune,
              color: Colors.grey,
            ),

            border: InputBorder.none,

            contentPadding:
                EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
      ),
    );
  }
}

/* ================= SMALL ICON ================= */

class _SmallIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _SmallIcon({
    required this.icon,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withValues(alpha: 0.06),

            blurRadius: 14,

            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Icon(
        icon,
        color: color,
        size: 22,
      ),
    );
  }
}

/* ================= CATEGORIES ================= */

class _CategoriesSection extends StatelessWidget {
  const _CategoriesSection();

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "title": "Skin",
        "image": "assets/skin.jpg",
      },

      {
        "title": "Makeup",
        "image": "assets/makeup.jpg",
      },

      {
        "title": "Hair",
        "image": "assets/hair.jpg",
      },

      {
        "title": "Body",
        "image": "assets/body.jpg",
      },
    ];

    return SizedBox(
      height: 110,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        physics:
            const BouncingScrollPhysics(),

        itemCount: categories.length,

        itemBuilder: (context, index) {
          final item = categories[index];

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 22 : 12,

              right:
                  index == categories.length - 1
                      ? 22
                      : 0,
            ),

            child: Column(
              children: [
                GestureDetector(
                 onTap: () {
  final title = item["title"] ?? "";

  if (title == "Skin") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SkinQuestionPage(),
      ),
    );
  }
},

                  child: Container(
                    width: 72,
                    height: 72,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      gradient:
                          const LinearGradient(
                        begin: Alignment.topLeft,
                        end:
                            Alignment.bottomRight,

                        colors: [
                          Color(0xFFFFE3F1),
                          Color(0xFFFF7EB6),
                          Color(0xFFE91E63),
                        ],
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFFFF4FA3,
                          ).withValues(
                            alpha: 0.45,
                          ),

                          blurRadius: 25,

                          spreadRadius: 2,

                          offset:
                              const Offset(0, 0,)
                        ),

                        BoxShadow(
                          color: Colors.white
                              .withValues(
                            alpha: 0.7,
                          ),

                          blurRadius: 12,

                          spreadRadius: -2,

                          offset:
                              const Offset(-3, -3),
                        ),
                      ],
                    ),

                    child: Container(
                      margin:
                          const EdgeInsets.all(6),

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(
                          color: Colors.white
                              .withValues(
                            alpha: 0.5,
                          ),

                          width: 2,
                        ),
                      ),

                      child: ClipOval(
                        child: SizedBox(
                          width: 72,
                          height: 72,

                          child: Image.asset(
                            item["image"]!,

                            fit: BoxFit.cover,

                            filterQuality:
                                FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  item["title"]!,

                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight:
                        FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* ================= PRODUCTS ================= */

class _ProductSection extends StatelessWidget {
  final List products;

  const _ProductSection({
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(20),

        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xFFE91E63),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,

      physics:
          const NeverScrollableScrollPhysics(),

      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),

      itemCount: products.length,

      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        crossAxisSpacing: 14,

        mainAxisSpacing: 14,

        childAspectRatio: 0.62,
      ),

      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () {},

          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),

              borderRadius:
                  BorderRadius.circular(22),

              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(alpha: 0.06),

                  blurRadius: 20,

                  spreadRadius: 1,

                  offset: const Offset(0, 10),
                ),

                BoxShadow(
                  color: Colors.pink
                      .withValues(alpha: 0.04),

                  blurRadius: 25,

                  spreadRadius: 2,

                  offset: const Offset(0, 12),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(
                          top:
                              Radius.circular(22),
                        ),

                        child: Image.network(
                          product['image'],

                          width: double.infinity,

                          fit: BoxFit.cover,

                          filterQuality:
                              FilterQuality.high,

                          loadingBuilder:
                              (
                                context,
                                child,
                                loadingProgress,
                              ) {
                            if (loadingProgress ==
                                null) {
                              return child;
                            }

                            return Container(
                              color:
                                  Colors.grey.shade100,

                              child:
                                  const Center(
                                child:
                                    CircularProgressIndicator(
                                  color: Color(
                                    0xFFE91E63,
                                  ),
                                ),
                              ),
                            );
                          },

                          errorBuilder:
                              (
                                context,
                                error,
                                stackTrace,
                              ) {
                            return Container(
                              color:
                                  Colors.grey.shade200,

                              child:
                                  const Center(
                                child: Icon(
                                  Icons
                                      .image_not_supported,

                                  size: 40,

                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Positioned(
                        top: 10,
                        right: 10,

                        child: Container(
                          width: 34,
                          height: 34,

                          decoration:
                              BoxDecoration(
                            color: Colors.white
                                .withValues(
                              alpha: 0.95,
                            ),

                            shape: BoxShape.circle,

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withValues(
                                  alpha: 0.08,
                                ),

                                blurRadius: 10,
                              ),
                            ],
                          ),

                          child: const Icon(
                            Icons.favorite_border,

                            color:
                                Color(0xFFE91E63),

                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.all(12),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        product['name_en'],

                        maxLines: 1,

                        overflow:
                            TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 15,

                          fontWeight:
                              FontWeight.w700,

                          letterSpacing: 0.2,

                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "${product['price']} DA",

                        style: const TextStyle(
                          fontSize: 15,

                          fontWeight:
                              FontWeight.bold,

                          color:
                              Color(0xFFE91E63),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        height: 38,

                        width: double.infinity,

                        decoration: BoxDecoration(
                          gradient:
                              const LinearGradient(
                            begin:
                                Alignment.topLeft,

                            end:
                                Alignment.bottomRight,

                            colors: [
                              Color(0xFFFF4D8D),
                              Color(0xFFE91E63),
                            ],
                          ),

                          borderRadius:
                              BorderRadius.circular(
                            12,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFFE91E63,
                              ).withValues(
                                alpha: 0.35,
                              ),

                              blurRadius: 12,

                              offset:
                                  const Offset(
                                0,
                                5,
                              ),
                            ),
                          ],
                        ),

                        child: const Center(
                          child: Text(
                            "View Product",

                            style: TextStyle(
                              color: Colors.white,

                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

