import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart' as intl;
import 'package:news_app_uts/pages/on_boarding_page.dart';
import 'package:news_app_uts/providers/ekonomi_news_provider.dart';
import 'package:news_app_uts/providers/nasional_news_provider.dart';
import 'package:news_app_uts/providers/news_update_provider.dart';
import 'package:news_app_uts/providers/tech_new_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi locale Indonesia
  await intl.initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsUpdateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TechNewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EkonomiNewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NasionalNewsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'UTS',
        theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OnBoardingPage(),
      ),
    );
  }
}
