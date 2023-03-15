import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:teste_hazeshift/HomeTasks/Model/taskList.dart';
import 'package:teste_hazeshift/HomeTasks/View/newTask.dart';

void main() {
  runApp(const HomeList());
}

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minhas Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/addTask': (context) => AddTaskScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskList> _tasks = [];

  bool _isLoading = true;

  Future<void> _addTask(BuildContext context) async {
    // Navega para a tela AddTaskScreen e espera que ela seja concluída
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen()),
    );

    if (newTask != null) {
      // Adiciona a nova tarefa à lista de tarefas
      setState(() {
        _tasks.add(newTask);
      });
    }
  }

  void readJson() async {
    final String response = await rootBundle.loadString('assets/tasks.json');
    final data = await json.decode(response);
    final List<TaskList> taskList =
        (data['tasks'] as List).map((task) => TaskList.fromJson(task)).toList();
    setState(() {
      _tasks = taskList;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Tarefas"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(5),
                child: ListTile(
                    title: Text(_tasks[index].taskItems,
                        style: _tasks[index].taskDone
                            ? TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                              )
                            : null),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Checkbox(
                            value: _tasks[index].taskDone,
                            onChanged: (value) {
                              setState(() {
                                _tasks[index].taskDone = value ?? false;
                              });
                            },
                            activeColor: Colors
                                .green, // adiciona a cor verde quando clicado
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _tasks.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    )),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _addTask(context),
      ),
    );
  }
}
