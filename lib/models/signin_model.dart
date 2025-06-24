class SigninModel {
  final String? email;
  final String? password;

  SigninModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
