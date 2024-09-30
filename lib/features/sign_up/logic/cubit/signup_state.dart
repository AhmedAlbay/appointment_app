import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart'; // Import the generated file

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading; // Private class (prefixed with _)
  const factory SignupState.success(T data) = Success<T>; // Private class (prefixed with _)
  const factory SignupState.error({required String error}) = Error; // Private class (prefixed with _)
}
