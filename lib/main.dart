import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/portfolio_viewmodel.dart';
import 'views/portfolio_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PortfolioViewModel(),
      child: MaterialApp(
        title: 'Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2563EB),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.transparent,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
          ),
        ),
        home: const PortfolioPage(),
      ),
    );
  }
}
