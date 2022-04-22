class DadosUser {
  String login;
  String nome;
  String bio;
  String avatarUrl;

  DadosUser(
      {required this.login,
      required this.nome,
      required this.bio,
      required this.avatarUrl});

  factory DadosUser.fromJson(Map<String, dynamic> json) {
    return DadosUser(
      login: json['login'],
      nome: json['name'],
      bio: json['bio'],
      avatarUrl: json['avatar_url'],
    );
  }
}
