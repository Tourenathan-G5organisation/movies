class Person {
  final String name;
  final String url;

  Person({
    this.name,
    this.url,
  });

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['profile_path'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
