import 'package:flutter/material.dart';

import 'tarefa.dart';

void main() {
  runApp(const ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  const ListaTarefasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ListaScreen());
  }
}

class ListaScreen extends StatefulWidget {
  const ListaScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  List<Tarefa> tarefas = <Tarefa>[];
  TextEditingController controller = TextEditingController();

  void adicionaTarefa(String nome) {
    setState(() {
      tarefas.add(Tarefa(nome));
    });

    controller.clear();
  }

  Widget getItem(Tarefa tarefa) {
    return Row(
      children: [
        IconButton(
          icon: Icon(tarefa.concluida! ? Icons.check_box : Icons.check_box_outline_blank, size: 42.0, color: Colors.green),
          iconSize: 42.0,
          onPressed: () {
            setState(() {
              if (tarefa.concluida! == true) {
                tarefa.concluida = false;
              }
              else {
                tarefa.concluida = true;
              }
            });
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(tarefa.nome!, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
            Text(tarefa.data!.toIso8601String()),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Tarefas")),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: adicionaTarefa
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (_, index) {
                return getItem(tarefas[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
