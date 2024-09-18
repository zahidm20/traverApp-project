// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

part of 'model.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String status;
  String message;
  DataLogin data;

  Login({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        message: json["message"],
        data: DataLogin.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DataLogin {
  int id;
  String nama;
  String email;
  String password;
  String refreshToken;
  String accessToken;

  DataLogin({
    required this.id,
    required this.nama,
    required this.email,
    required this.password,
    required this.refreshToken,
    required this.accessToken,
  });

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
        refreshToken: json["refresh_token"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "password": password,
        "refresh_token": refreshToken,
        "access_token": accessToken,
      };
}
