// Aluno: Jefferson Santos do Nascimento

// Agregação e Composição
import 'dart:convert';
import 'dart:async';
import 'dart:io';

// Imprime uma barra de progresso na mesma linha.
void printProgressBar(double progress, {int width = 40, String fillChar = '#', String emptyChar = '-'}) {
  if (progress < 0) progress = 0;
  if (progress > 1) progress = 1;
  final filled = (progress * width).round();
  final empty = width - filled;
  final percent = (progress * 100).toStringAsFixed(1);
  final bar = '${fillChar * filled}${emptyChar * empty}';
  // \r volta o cursor pro início da linha sem pular para a próxima
  stdout.write('\r[$bar] $percent%');
  // opcional: força escrita imediata (na maioria dos terminais funciona bem sem)
  // stdout.flush(); // não existe em todos os ambientes Dart, normalmente não necessário
}

void startProgressBar(int totalSteps) {
  // opcional: esconder cursor para ficar mais bonito (ANSI)
  // stdout.write('\x1B[?25l');

  try {
    for (var i = 0; i <= totalSteps; i++) {
      final progress = i / totalSteps;
      printProgressBar(progress, width: 30, fillChar: '=', emptyChar: ' ');
      // simula trabalho
      sleep(Duration(milliseconds: 20));
    }
    // termina com newline
    stdout.writeln();
  } finally {
    // sempre mostrar o cursor de volta
    stdout.write('\x1B[?25h');
  }
}

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map toJson() => {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => {
        'nome': f._nome,
        'dependentes': f._dependentes.map((d) => d._nome).toList(),
      }).toList(),
  };
}

Future<void> main() async {


    print('================== Atividade 02 ====================\n');

    print('Criando dependentes !');
    startProgressBar(20) ;
    // 1. Criar varios objetos Dependentes
    final dependente1 = Dependente('Ana');
    final dependente2 = Dependente('Bruno');
    final dependente3 = Dependente('Carla');
    final dependente4 = Dependente('Daniel');
    final dependente5 = Dependente('Eva');
    final dependente6 = Dependente('Felipe');
    final dependente7 = Dependente('Gabriela');
    final dependente8 = Dependente('Hugo');
    final dependente9 = Dependente('Isabela');
    final dependente10 = Dependente('João');
    // print('\nDependentes criados com sucesso ! \n');  

    print('Criando funcionarios !');
    startProgressBar(40);
    // 2. Criar varios objetos Funcionario
    // 3. Associar os Dependentes criados aos respectivos funcionarios
    final funcionario1 = Funcionario('Carlos', [dependente1, dependente2]);
    final funcionario2 = Funcionario('Mariana', [dependente3, dependente4, dependente5]);
    final funcionario3 = Funcionario('Pedro', [dependente6]);
    final funcionario4 = Funcionario('Luciana', [dependente7, dependente8]);
    final funcionario5 = Funcionario('Rafael', [dependente9, dependente10]);

    print('Criando lista de funcionários !');
    startProgressBar(60);
    // 4. Criar uma lista de Funcionarios
    final funcionarios = [funcionario1, funcionario2, funcionario3, 
                          funcionario4, funcionario5];

    print('Criando equipe de projeto !');
    startProgressBar(80);
    // 5. criar um objeto Equipe Projeto chamando o metodo
    //    contrutor que da nome ao projeto e insere uma
    //    coleção de funcionario
    final equipeProjeto = EquipeProjeto('Projeto pdm', funcionarios);

    print('Convertendo equipe de projeto para JSON !');
    startProgressBar(100);

    print('\nEquipe de projeto criada com sucesso no formato Json: \n');
    // 6. Printar no formato JSON o objeto Equipe Projeto.
    String jsonEquipe = jsonEncode(equipeProjeto);
    print(jsonEquipe);
}