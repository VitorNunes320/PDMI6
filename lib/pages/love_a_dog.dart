import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/task_provider.dart';
import 'dashboard_list_page.dart';

class LoveADogPage extends StatefulWidget {
  const LoveADogPage({Key? key}) : super(key: key);

  @override
  State<LoveADogPage> createState() => _LoveADogPageState();
}

class _LoveADogPageState extends State<LoveADogPage> {
  bool isLoved = false;
  double _getWidth(dimensions) {
    return dimensions.maxWidth / 1.1;
  }

  double _getHeight(dimensions) {
    return dimensions.maxHeight / 1.1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Love A Dog',
          style: TextStyle(
            fontFamily: 'Proxima Nova Bold',
            fontSize: 32,
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: ((context) => TodoProvider()),
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: LayoutBuilder(
            builder: (context, dimensions) {
              return GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    isLoved = !isLoved;
                  });
                },
                child: Image(
                  image: isLoved
                      ? AssetImage('assets/images/Fifi-Liked.png')
                      : AssetImage('assets/images/Fifi.png'),
                  width: _getWidth(dimensions),
                  height: _getHeight(dimensions),
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
