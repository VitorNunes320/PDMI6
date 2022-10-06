import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdmi6/pages/dashboard_page.dart';
import 'package:pdmi6/pages/love_a_dog.dart';
import 'package:pdmi6/pages/my_pet_camera.dart';
import 'package:pdmi6/pages/my_pets_page.dart';
import 'package:pdmi6/routes.dart';
import 'package:pdmi6/widgets/pet_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  late MyPetCamera cameraPage;
  final screens = [
    const DashboardPage(),
    MyPetsPage(),
    const DashboardPage(),
    const LoveADogPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Provider<PetProvider>(
      create: (_) => PetProvider(),
      child: MaterialApp(
        initialRoute: RouteGenerator.letsStartPage,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: currentIndex != 2
              ? IndexedStack(
                  index: currentIndex,
                  children: screens,
                )
              : cameraPage,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
                selectedItemColor: const Color.fromARGB(255, 29, 108, 227),
                backgroundColor: const Color.fromARGB(255, 209, 255, 253),
                currentIndex: currentIndex,
                onTap: (index) async {
                  if (index == 2) {
                    await availableCameras().then(
                      (value) => {
                        setState(
                          () => {
                            currentIndex = index,
                            cameraPage = MyPetCamera(cameras: value),
                          },
                        ),
                      },
                    );
                  } else {
                    setState(() => currentIndex = index);
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: ' ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      IconData(0xe4a1, fontFamily: 'MaterialIcons'),
                    ),
                    label: ' ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.globe),
                    label: ' ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person_circle),
                    label: ' ',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
