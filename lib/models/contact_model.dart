class ContactModel {
  final String? id;
  final String name;
  final String email;
  ContactModel({
    this.id,
    required this.name,
    required this.email,
  });
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
