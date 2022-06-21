class User {
  final String nome;
  final String email;
  final int fone;
  final String tipo;
  final String mensagem;
  final int cod;
  final String corretor;
  final DateTime ultCont;

  const User({
    required this.nome,
    required this.email,
    required this.fone,
    required this.tipo,
    required this.mensagem,
    required this.cod,
    required this.corretor,
    required this.ultCont,
  });

  User copy({
    String? nome,
    String? email,
    int? fone,
    String? tipo,
    String? mensagem,
    int? cod,
    String? corretor,
    DateTime? ultCont,
  }) =>
      User(
        nome: nome ?? this.nome,
        email: email ?? this.email,
        fone: fone ?? this.fone,
        tipo: tipo ?? this.tipo,
        mensagem: mensagem ?? this.mensagem,
        cod: cod ?? this.cod,
        corretor: corretor ?? this.corretor,
        ultCont: ultCont ?? this.ultCont,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          nome == other.nome &&
          email == other.email &&
          fone == other.fone &&
          tipo == other.tipo &&
          mensagem == other.mensagem &&
          cod == other.cod &&
          corretor == other.corretor &&
          ultCont == other.ultCont;

  @override
  int get hashCode =>
      nome.hashCode ^
      email.hashCode ^
      fone.hashCode ^
      tipo.hashCode ^
      mensagem.hashCode ^
      cod.hashCode ^
      corretor.hashCode ^
      ultCont.hashCode;
}
