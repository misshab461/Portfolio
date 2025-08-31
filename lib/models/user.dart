class UserMessage {
  final String name;
  final String email;
  final String subject;
  final String message;

  UserMessage({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    };
  }
}
