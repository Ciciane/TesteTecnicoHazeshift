import 'package:flutter/material.dart';
import 'package:teste_hazeshift/HomeTasks/Model/taskList.dart';
import 'package:teste_hazeshift/HomeTasks/View/homeList.dart';

class AddTaskScreen extends StatelessWidget {
  // será usado para obter o texto digitado pelo usuário no campo de texto de adicionar tarefas.
  final TextEditingController _taskTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Adicione uma nova tarefa'),
            ),
            TextField(
              controller: _taskTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                TaskList newTask = TaskList(
                    taskItems: _taskTextController.text, taskDone: false);
                Navigator.pop(context,
                    newTask); // enviar a nova tarefa de volta para a tela anterior
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
