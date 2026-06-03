 import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // ✅ إضافة فقط
import 'package:shared_preferences/shared_preferences.dart';
Map<String, Map<String, String>> texts = {
  'ar': {
    'login': 'انشاء حساب',
    'username': 'اسم المستخدم',
    'email': 'البريد الإلكتروني',
    'password':'كلمة السر',

  },
  'fr': {
    'login': 'créer un compte',
    'username': "Nom d'utilisateur",
    'email': 'Email',
    'password': 'Mot de passe',
  },

  'en': {
    'login': 'create account',
    'username': 'Username',
    'email': 'Email',
    'password': 'Password',
  },
};

class RegisterPage extends StatefulWidget {
  final Function(String)? onChangeLanguage;

  const RegisterPage({super.key, this.onChangeLanguage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController usernameController =
      TextEditingController();

  TextEditingController emailController =
      TextEditingController();

  TextEditingController passwordController =
      TextEditingController();

  String selectedLanguage = "العربية";

  String get currentLang =>
      Localizations.localeOf(context).languageCode;

  @override
  Widget build(BuildContext context) {

    bool isArabic = currentLang == "ar";

    return Directionality(

      textDirection:
          isArabic
              ? TextDirection.rtl
              : TextDirection.ltr,

      child: Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFDFDFD),

        body: Container(

          decoration: const BoxDecoration(

            gradient: LinearGradient(

              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              colors: [

                Color(0xFFFFF7FA),
                Color(0xFFFFFFFF),
                Color(0xFFFFF0F6),

              ],
            ),
          ),

          child: SafeArea(

            child: Stack(

              children: [

                Positioned(

                  bottom: -120,
                  left: -80,

                  child: Container(

                    width: 260,
                    height: 260,

                    decoration: BoxDecoration(

                      color: const Color(0xFFFF4FA2)
                          .withOpacity(0.15),

                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Positioned(

                  top: -80,
                  right: -60,

                  child: Container(

                    width: 200,
                    height: 200,

                    decoration: BoxDecoration(

                      color: const Color(0xFFE91E63)
                          .withOpacity(0.10),

                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Center(

                  child: Padding(

                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                    ),

                    child: Column(

                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        const Text(

                          "INAYA",

                          style: TextStyle(

                            fontSize: 54,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFE91E63),
                            letterSpacing: 2,
                          ),
                        ),

                        const SizedBox(height: 35),

                        
                        buildInputField(

                          isArabic: isArabic,

                          controller:
                              usernameController,

                          hint: texts[currentLang]![
                              'username']!,

                          icon: Icons.person,
                        ),

                        const SizedBox(height: 18),

                        buildInputField(

                          isArabic: isArabic,

                          controller: emailController,

                          hint:
                              texts[currentLang]!['email']!,

                          icon: Icons.email,
                        ),

                        const SizedBox(height: 18),

                        buildInputField(

                          isArabic: isArabic,

                          controller:
                              passwordController,

                          hint: texts[currentLang]![
                              'password']!,

                          icon: Icons.lock,

                          isPassword: true,
                        ),

                        const SizedBox(height: 20),

                        Container(

                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 18,
                          ),

                          height: 65,

                          decoration: BoxDecoration(

                            color: Colors.white,

                            borderRadius:
                                BorderRadius.circular(20),

                            boxShadow: [

                              BoxShadow(

                                color: Colors.black
                                    .withOpacity(0.05),

                                blurRadius: 15,
                              ),
                            ],
                          ),

                          child: DropdownButtonHideUnderline(

                            child: DropdownButton<String>(

                              value: selectedLanguage,

                              isExpanded: true,

                              items: const [

                                DropdownMenuItem(
                                  value: "العربية",
                                  child: Text("العربية"),
                                ),

                                DropdownMenuItem(
                                  value: "Français",
                                  child: Text("Français"),
                                ),

                                DropdownMenuItem(
                                  value: "English",
                                  child: Text("English"),
                                ),
                              ],
onChanged: (value) async {

  setState(() {
    selectedLanguage = value!;
  });

  String langCode =
      value == "العربية"
          ? "ar"
          : value == "Français"
              ? "fr"
              : "en";

  final prefs =
      await SharedPreferences.getInstance();

  await prefs.setString(
    'lang',
    langCode,
  );

  widget.onChangeLanguage?.call(
    langCode,
  );

},
                            ),
                          ),
                        ),
                              

                        const SizedBox(height: 30),

                        Container(

                          width: double.infinity,
                          height: 65,

                          decoration: BoxDecoration(

                            borderRadius:
                                BorderRadius.circular(30),

                            gradient: const LinearGradient(

                              colors: [

                                Color(0xFFFF4FA2),
                                Color(0xFFE91E63),

                              ],
                            ),
                          ),

                          child: ElevatedButton(

                            onPressed: () async {

                              if (usernameController
                                      .text
                                      .isEmpty ||
                                  emailController
                                      .text
                                      .isEmpty ||
                                  passwordController
                                      .text
                                      .isEmpty) {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(

                                  const SnackBar(
                                    content: Text(
                                      "Please fill all fields",
                                    ),
                                  ),
                                );

                                return;
                              }

                              try {

                                final response =
                                    await http.post(

                                  Uri.parse(
                                    "http://192.168.1.40:3000/register",
                                  ),

                                  headers: {
                                    "Content-Type":
                                        "application/json",
                                  },

                                  body: jsonEncode({

                                    "username":
                                        usernameController.text,

                                    "email":
                                        emailController.text,

                                    "password":
                                        passwordController.text,

                                    "language":
                                        currentLang,

                                    "skin_type_id": null
                                  }),
                                );

                                final data =
                                    jsonDecode(response.body);

                                if (response.statusCode ==
                                    200) {

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(

                                    SnackBar(
                                      content: Text(
                                        data['message'],
                                      ),
                                    ),
                                  );

                                 
final prefs =
    await SharedPreferences.getInstance();

await prefs.setBool(
  'isLoggedIn',
  true,
);

await prefs.setString(
  'username',
  usernameController.text,
);

await prefs.setString(
  'email',
  emailController.text,
);
String langCode =
    selectedLanguage == "العربية"
        ? "ar"
        : selectedLanguage == "Français"
            ? "fr"
            : "en";

await prefs.setString('lang', langCode);

 usernameController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                  // ✅ الإضافة فقط (بدون تغيير التصميم)
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HomePage(),
                                    ),
                                  );

                                } else {

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(

                                    SnackBar(
                                      content: Text(
                                        data['message'],
                                      ),
                                    ),
                                  );
                                }

                              } catch (e) {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(

                                  const SnackBar(
                                    content: Text(
                                      "Server connection error",
                                    ),
                                  ),
                                );
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.transparent,
                              shadowColor:
                                  Colors.transparent,
                            ),

                            child: Text(
                              texts[currentLang]!['login']!,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            
                            ),
                          ),
                        ),
                        ],
                  
                    )
                  ),
                ),
                ],
                  ),
            ),
          ),
          
        ),
    );
    
    
  }

  Widget buildInputField({

    required bool isArabic,
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {

    return SizedBox(

      height: 65,

      child: TextField(

        controller: controller,
        obscureText: isPassword,

        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}