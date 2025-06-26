class Pet {
  final int? id;
  final String nome;
  final String tipo;
  final String raca;
  final int idade;
  final String dono;
  final String motivoConsulta;
  final String indicacaoCuidados;

  Pet({
    this.id,
    required this.nome,
    required this.tipo,
    required this.raca,
    required this.idade,
    required this.dono,
    required this.motivoConsulta,
    required this.indicacaoCuidados,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      nome: json['nome'],
      tipo: json['tipo'],
      raca: json['raca'],
      idade: json['idade'],
      dono: json['dono'],
      motivoConsulta: json['motivoConsulta'] ?? '',
      indicacaoCuidados: json['indicacaoCuidados'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
      'raca': raca,
      'idade': idade,
      'dono': dono,
      'motivoConsulta': motivoConsulta,
      'indicacaoCuidados': indicacaoCuidados,
    };
  }
}
