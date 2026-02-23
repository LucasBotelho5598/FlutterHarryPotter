class Harry {
  final String name;
  final String image;

  const Harry({required this.name, required this.image});

  factory Harry.fromJson(Map<String, dynamic> json) {    
    return Harry(name: json['name'] as String, image: json['image'] as String);
  }
}
