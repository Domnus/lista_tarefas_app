class Tarefa {
  String? nome;
  DateTime? data;
  bool? concluida;

  Tarefa(this.nome) {
    data = DateTime.now();
    concluida = false;
  }
}