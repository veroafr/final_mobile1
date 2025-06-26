import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../services/db_service.dart';

class PetDetailScreen extends StatefulWidget {
  const PetDetailScreen({super.key});

  @override
  _PetDetailScreenState createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _tipo = TextEditingController();
  final _raca = TextEditingController();
  final _idade = TextEditingController();
  final _dono = TextEditingController();
  final _motivoConsulta = TextEditingController();
  final _indicacaoCuidados = TextEditingController();

  final DBService dbService = DBService();
  Pet? editingPet;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final pet = ModalRoute.of(context)!.settings.arguments as Pet?;
    if (pet != null && editingPet == null) {
      editingPet = pet;
      _nome.text = pet.nome;
      _tipo.text = pet.tipo;
      _raca.text = pet.raca;
      _idade.text = pet.idade.toString();
      _dono.text = pet.dono;
      _motivoConsulta.text = pet.motivoConsulta;
      _indicacaoCuidados.text = pet.indicacaoCuidados;
    }
  }

  void savePet() async {
    if (_formKey.currentState!.validate()) {
      final pet = Pet(
        id: editingPet?.id,
        nome: _nome.text,
        tipo: _tipo.text,
        raca: _raca.text,
        idade: int.parse(_idade.text),
        dono: _dono.text,
        motivoConsulta: _motivoConsulta.text,
        indicacaoCuidados: _indicacaoCuidados.text,
      );

      if (editingPet == null) {
        await dbService.insertPet(pet);
      } else {
        await dbService.updatePet(pet);
      }

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pet salvo com sucesso!')),
      );
    }
  }

  @override
  void dispose() {
    _nome.dispose();
    _tipo.dispose();
    _raca.dispose();
    _idade.dispose();
    _dono.dispose();
    _motivoConsulta.dispose();
    _indicacaoCuidados.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(editingPet == null ? 'Novo Pet' : 'Editar Pet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nome,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (v) => v!.isEmpty ? 'Preencha o nome' : null,
              ),
              DropdownButtonFormField<String>(
                value: _tipo.text.isNotEmpty ? _tipo.text : null,
                decoration: const InputDecoration(labelText: 'Espécie'),
                items: const [
                   DropdownMenuItem(value: 'Cachorro', child: Text('Cachorro')),
  DropdownMenuItem(value: 'Gato', child: Text('Gato')),
  DropdownMenuItem(value: 'Coelho', child: Text('Coelho')),
  DropdownMenuItem(value: 'Hamster', child: Text('Hamster')),
  DropdownMenuItem(value: 'Cavalo', child: Text('Cavalo')),
  DropdownMenuItem(value: 'Pássaro', child: Text('Pássaro')),
  DropdownMenuItem(value: 'Papagaio', child: Text('Papagaio')),
  DropdownMenuItem(value: 'Tartaruga', child: Text('Tartaruga')),
  DropdownMenuItem(value: 'Peixe', child: Text('Peixe')),
  DropdownMenuItem(value: 'Porquinho-da-índia', child: Text('Porquinho-da-índia')),
  DropdownMenuItem(value: 'Rato', child: Text('Rato')),
  DropdownMenuItem(value: 'Ovelha', child: Text('Ovelha')),
  DropdownMenuItem(value: 'Bode', child: Text('Bode')),
  DropdownMenuItem(value: 'Vaca', child: Text('Vaca')),
  DropdownMenuItem(value: 'Pato', child: Text('Pato')),
  DropdownMenuItem(value: 'Galinha', child: Text('Galinha')),
  DropdownMenuItem(value: 'Galo', child: Text('Galo')),
  DropdownMenuItem(value: 'Porco', child: Text('Porco')),
  DropdownMenuItem(value: 'Lagarto', child: Text('Lagarto')),
  DropdownMenuItem(value: 'Furão', child: Text('Furão')),
  DropdownMenuItem(value: 'Cobra', child: Text('Cobra')),
  DropdownMenuItem(value: 'Outro', child: Text('Outro')),
                ],
                onChanged: (value) {
                  setState(() {
                    _tipo.text = value!;
                  });
                },
                validator: (value) =>
                    value == null || value.isEmpty ? 'Selecione a espécie' : null,
              ),
              TextFormField(
                controller: _raca,
                decoration: const InputDecoration(labelText: 'Raça'),
                validator: (v) => v!.isEmpty ? 'Preencha a raça' : null,
              ),
              TextFormField(
                controller: _idade,
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Preencha a idade' : null,
              ),
              TextFormField(
                controller: _dono,
                decoration: const InputDecoration(labelText: 'Dono'),
                validator: (v) => v!.isEmpty ? 'Preencha o nome do dono' : null,
              ),
              TextFormField(
                controller: _motivoConsulta,
                decoration: const InputDecoration(labelText: 'Motivo da Consulta'),
                validator: (v) =>
                    v!.isEmpty ? 'Informe o motivo da consulta' : null,
              ),
              TextFormField(
                controller: _indicacaoCuidados,
                decoration: const InputDecoration(labelText: 'Indicação de Cuidados'),
                validator: (v) =>
                    v!.isEmpty ? 'Informe a indicação de cuidados' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: savePet, child: const Text('Salvar')),
            ],
          ),
        ),
      ),
    );
  }
}
