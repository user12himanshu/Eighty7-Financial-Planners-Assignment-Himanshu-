import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/services/api_service.dart';
import 'package:untitled/services/route_service.dart';
import 'package:untitled/utils/theme_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RouteService routeService = RouteService();
  ThemeUtils themeUtils = ThemeUtils();

  @override
  void initState() {
    Api api = Api();
    api.apiKey = AppConstants.apiKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      getPages: routeService.pages,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ThemeUtils.scaffoldBackgroundColor,
        textTheme: TextTheme(
            displayLarge: themeUtils.displayLarge,
            titleMedium: themeUtils.titleMedium,
            titleSmall: themeUtils.titleSmall,
            displayMedium: themeUtils.displayMedium,
            displaySmall: themeUtils.displaySmall,
            headlineMedium: themeUtils.headlineMedium,
            bodyMedium: themeUtils.bodyMedium),
      ),
      initialRoute: RouteService.homeScreenRoute,
      home: const HomeScreen(),
    );
  }
}
