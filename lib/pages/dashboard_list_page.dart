import 'package:flutter/material.dart';
import 'package:pdmi6/pages/task_action.dart';
import 'package:provider/provider.dart';
import '../widgets/task_provider.dart';

class DashboardListPage extends StatefulWidget {
  const DashboardListPage({Key? key}) : super(key: key);
  @override
  _DashboardListPageState createState() => _DashboardListPageState();
}

class _DashboardListPageState extends State<DashboardListPage> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add a new Task"),
            content: TextField(
              autofocus: true,
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Add New Task"),
              onSubmitted: (_) => _submit(),
            ),
            actions: [
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(120, 40),
                ),
                child: const Text("Submit"),
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
    }

    return Scaffold(
      body: const TodoAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: (() {
          _showAddTextDialog();
        }),
        tooltip: "Add a task",
        child: const Icon(Icons.add),
      ),
    );
  }
}
