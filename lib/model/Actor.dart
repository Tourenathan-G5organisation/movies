class Actor {
  final String name;
  final String avatarUrl;

  Actor({
    this.name,
    this.avatarUrl,
  });

  Actor.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        avatarUrl = json['url'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'avatarUrl': avatarUrl,
      };
}
