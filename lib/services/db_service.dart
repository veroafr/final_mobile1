import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pet.dart';

class DBService {
  final String baseUrl = 'http://localhost:8080';

  Future<List<Pet>> getPets() async {
    final response = await http.get(Uri.parse('$baseUrl/pets'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Pet.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener la lista de mascotas');
    }
  }

  Future<void> insertPet(Pet pet) async {
    final response = await http.post(
      Uri.parse('$baseUrl/pets'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(pet.toJson()),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Error al insertar mascota');
    }
  }

  Future<void> updatePet(Pet pet) async {
    final response = await http.put(
      Uri.parse('$baseUrl/pets/${pet.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(pet.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar mascota');
    }
  }

  Future<void> deletePet(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/pets/$id'));

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception('Error al eliminar mascota');
    }
  }
}
