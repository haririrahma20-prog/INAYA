import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const InayaApp());
}

class InayaApp extends StatefulWidget {
  const InayaApp({super.key});

  @override
  State<InayaApp> createState() => _InayaAppState();
}

class _InayaAppState extends State<InayaApp> {
  Locale _locale = const Locale('ar');

  void changeLanguage(String lang) {
    setState(() {
      _locale = Locale(lang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      locale: _locale,

      supportedLocales: const [
        Locale('ar'),
        Locale('fr'),
        Locale('en'),
      ],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: SplashPage(onChangeLanguage: changeLanguage),
    );
  }
}

// ---------------- SPLASH (نفس التصميم 100%) ----------------

class SplashPage extends StatefulWidget {
  final Function(String) onChangeLanguage;

  const SplashPage({super.key, required this.onChangeLanguage});

  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 5));

    final prefs = await SharedPreferences.getInstance();

    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    String lang = prefs.getString('lang') ?? 'ar';

    widget.onChangeLanguage(lang);

    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => RegisterPage(
            onChangeLanguage: widget.onChangeLanguage,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          'assets/inaya3.png',
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

 