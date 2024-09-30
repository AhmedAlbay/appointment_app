import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String email;
  final String password;
  @JsonKey(name:"password_confirmation") 
  final String confirmPassword; 
  final String name;
  final String phone;
  final int gender;

  SignupRequestBody({
    required this.confirmPassword, // Fixed typo here
    required this.name,
    required this.phone,
    required this.gender,
    required this.email,
    required this.password,
  });

  // Add the `fromJson` factory method

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
