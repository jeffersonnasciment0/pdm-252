// Aluno: Jefferson Santos do Nascimento

// Agregação e Composição
import 'dart:convert';

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
}

void main() {
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


    // 2. Criar varios objetos Funcionario
    // 3. Associar os Dependentes criados aos respectivos funcionarios
    final funcionario1 = Funcionario('Carlos', [dependente1, dependente2]);
    final funcionario2 = Funcionario('Mariana', [dependente3, dependente4, dependente5]);
    final funcionario3 = Funcionario('Pedro', [dependente6]);
    final funcionario4 = Funcionario('Luciana', [dependente7, dependente8]);
    final funcionario5 = Funcionario('Rafael', [dependente9, dependente10]);



    // 4. Criar uma lista de Funcionarios
    final funcionarios = [funcionario1, funcionario2, funcionario3, 
                          funcionario4, funcionario5];

    // 5. criar um objeto Equipe Projeto chamando o metodo
    //    contrutor que da nome ao projeto e insere uma
    //    coleção de funcionario
    // 6. Printar no formato JSON o objeto Equipe Projeto.
}