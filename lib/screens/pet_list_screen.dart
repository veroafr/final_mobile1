import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../services/db_service.dart';

class PetListScreen extends StatefulWidget {
  const PetListScreen({super.key});

  @override
  State<PetListScreen> createState() => _PetListScreenState();
}

class _PetListScreenState extends State<PetListScreen> {
  final DBService dbService = DBService();
  List<Pet> pets = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchPets();
  }

  void fetchPets() async {
    try {
      final data = await dbService.getPets();
      setState(() {
        pets = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Erro ao carregar pets: $e';
        isLoading = false;
      });
    }
  }

  void deletePet(int id) async {
    await dbService.deletePet(id);
    fetchPets();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pet excluído.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fichas de Pets')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : ListView.builder(
                  itemCount: pets.length,
                  itemBuilder: (context, index) {
                    final pet = pets[index];
                    return Card(
                      margin:
                          const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      child: ListTile(
                        title: Text(
                          pet.nome,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${pet.tipo} - ${pet.raca} - ${pet.idade} anos\n'
                          'Dono: ${pet.dono}\n'
                          'Motivo: ${pet.motivoConsulta}\n'
                          'Cuidados: ${pet.indicacaoCuidados}',
                        ),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/details',
                                  arguments: pet,
                                ).then((_) => fetchPets());
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deletePet(pet.id!),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
