class MyUserEntity {
  String userId;
  String email;
  String password;
  bool hasActiveCard;
  MyUserEntity(
      {required this.userId,
      required this.email,
      required this.password,
      required this.hasActiveCard});

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'password': password,
      'hasActiveCard': hasActiveCard,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'],
      email: doc['email'],
      password: doc['password'],
      hasActiveCard: doc['hasActiveCard'],
    );
  }
}
