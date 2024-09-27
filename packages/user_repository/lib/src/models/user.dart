import 'package:user_repository/src/entities/user_entity.dart';

class MyUser {
  String userId;
  String email;
  String password;
  bool hasActiveCard;

  MyUser({
    required this.userId,
    required this.email,
    required this.password,
    required this.hasActiveCard,
  });

  static final empty =
      MyUser(userId: '', email: '', password: '', hasActiveCard: false);

  MyUserEntity toEntity() {
    return MyUserEntity(
        userId: userId,
        email: email,
        password: password,
        hasActiveCard: hasActiveCard);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userId: entity.userId,
        email: entity.email,
        password: entity.password,
        hasActiveCard: entity.hasActiveCard);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'MyUser: $userId, $email, $password, $hasActiveCard';
  }
}
