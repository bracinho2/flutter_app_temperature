class UsuarioFlutterando {
  final String login;
  final int id;
  final String node_id;
  final String avatar_url;

  UsuarioFlutterando(
    this.login,
    this.id,
    this.node_id,
    this.avatar_url,
  );

  UsuarioFlutterando copyWith({
    String? login,
    int? id,
    String? node_id,
    String? avatar_url,
  }) {
    return UsuarioFlutterando(
      login ?? this.login,
      id ?? this.id,
      node_id ?? this.node_id,
      avatar_url ?? this.avatar_url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'login': login});
    result.addAll({'id': id});
    result.addAll({'node_id': node_id});
    result.addAll({
      'avatar_url': avatar_url,
    });

    return result;
  }

  factory UsuarioFlutterando.fromMap(Map<String, dynamic> map) {
    return UsuarioFlutterando(
      map['login'] ?? '',
      map['id'] ?? '',
      map['node_id'] ?? '',
      map['avatar_url'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UsuarioFlutterando(login: $login, id: $id, node_id: $node_id, avatar_url: $avatar_url)';
  }
}
