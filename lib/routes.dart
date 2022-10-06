import 'package:flutter/material.dart';
import 'package:pdmi6/main.dart';
import 'package:pdmi6/pages/dashboard_page.dart';
import 'package:pdmi6/pages/lets_start_page.dart';
import 'package:pdmi6/pages/my_pets_page.dart';

class RouteGenerator {
  static const String myPetCameraPage = "/mypetcamera";
  static const String myPetsPage = "/mypets";
  static const String dashboardPage = "/dash";
  static const String letsStartPage = "/start";
  static const String mainPage = "/";

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case myPetsPage:
        return MaterialPageRoute(
          builder: (_) => MyPetsPage(),
        );
      case dashboardPage:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
        );
      case letsStartPage:
        return MaterialPageRoute(
          builder: (_) => const LetsStartPage(),
        );
      case mainPage:
        return MaterialPageRoute(
          builder: (_) => MainPage(),
        );
      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
