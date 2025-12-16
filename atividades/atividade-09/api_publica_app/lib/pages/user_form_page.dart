import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserFormPage extends StatefulWidget {
  final User? user;

  const UserFormPage({super.key, this.user});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _service = UserService();

  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController(text: widget.user?.firstName ?? '');
    _lastName = TextEditingController(text: widget.user?.lastName ?? '');
    _email = TextEditingController(text: widget.user?.email ?? '');
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        id: widget.user?.id ?? 0,
        firstName: _firstName.text,
        lastName: _lastName.text,
        email: _email.text,
        image: widget.user?.image ?? '',
      );

      if (widget.user == null) {
        await _service.createUser(user);
      } else {
        await _service.updateUser(user);
      }

      if (mounted) Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Novo Usuário' : 'Editar Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstName,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              TextFormField(
                controller: _lastName,
                decoration: const InputDecoration(labelText: 'Sobrenome'),
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _save, child: const Text('Salvar')),
            ],
          ),
        ),
      ),
    );
  }
}
