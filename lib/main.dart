import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String dispalyText = "task";
  TextEditingController textController = TextEditingController();

  List<String> tasks = [];

  void addTask() {
    setState(() {
      tasks.add(textController.text);
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO LIST',
        theme: ThemeData(
          fontFamily: 'Quicksand',
          primaryColor: const Color(0xFF00C853),
          scaffoldBackgroundColor: const Color(0xFFF1F8E9),
          cardColor: const Color.fromARGB(255, 211, 235, 183),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF4A90E2),
            foregroundColor: Colors.white,
          ), // Removed invalid 'Theme' parameter
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("TODO LIST"),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          labelText: "Enter a task",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.green,
                    height: 50.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      addTask();
                    },
                    child: const Text("Add Task"),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(tasks[index]),
                        textColor: const Color(0xFF1B5E20),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
