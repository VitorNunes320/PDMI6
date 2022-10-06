import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/task_provider.dart';
import 'dashboard_list_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Pet Task List',
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
        child: const DashboardListPage(),
      ),
    );
  }
}
