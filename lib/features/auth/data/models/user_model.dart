import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:spotify_app/features/auth/dmoain/entities/user_entity.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel({
    required super.userId,
    required super.email,
    required super.fullName,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      userId: user.uid,
      email: user.email??'',
      fullName: user.displayName??'',
    );
  }
}
