import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<String> todoItems = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo List App'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Enter todo item',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      setState(() {
                        todoItems.add(controller.text);
                        controller.clear();
                      });
                    }
                  },
                  child: Text('Add'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoItems.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text(todoItems[index]),
                        ),
                      ),
                      MaterialButton(
                        child: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            todoItems.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
