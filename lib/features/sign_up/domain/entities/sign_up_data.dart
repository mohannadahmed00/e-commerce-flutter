import 'package:equatable/equatable.dart';

class SignUpData extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;

  const SignUpData(this.name, this.phone, this.email, this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [name, phone, email, password];
}
