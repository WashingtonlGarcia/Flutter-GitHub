class Repository {
  int id;
  String fullName;
  String avatarUrl;
  String description;

  Repository({
    this.id,
    this.fullName,
    this.avatarUrl,
    this.description,
  });

  factory Repository.fromMap(dynamic map) {
    return Repository(
        id: map['id'] as int,
        avatarUrl: map['owner']['avatar_url'] as String,
        fullName: map['full_name'] as String,
        description: map['description'] as String);
  }

  @override
  String toString() {
    return 'Repository{id: $id, fullName: $fullName, avatarUrl: $avatarUrl, description: $description}';
  }
}
