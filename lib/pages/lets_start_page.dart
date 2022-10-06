import 'package:flutter/material.dart';
import '../routes.dart';

class LetsStartPage extends StatelessWidget {
  const LetsStartPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(241, 242, 246, 1),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Image(image: AssetImage('assets/images/Logo.png')),
            ),
            const Image(image: AssetImage('assets/images/Illustration.png')),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "The Pet Walk app is designed for taking care of your pet. Fixe objectives based on their needs. See their progresses and share them with the community.", 
                style: TextStyle(
                  fontFamily: 'Proxima Nova Bold',
                  color: Color.fromRGBO(120, 123, 123, 1),
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteGenerator.mainPage);
              },
              child: const Text(
                'Let\'s Start',
                style: TextStyle(
                  fontFamily: 'Proxima Nova Bold',
                  color: Colors.black,
                  fontSize: 16,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
