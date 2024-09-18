// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

part of 'model.dart';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  String status;
  String message;
  DataRegister data;

  Register({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        status: json["status"],
        message: json["message"],
        data: DataRegister.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DataRegister {
  DataRegister();

  factory DataRegister.fromJson(Map<String, dynamic> json) => DataRegister();

  Map<String, dynamic> toJson() => {};
}
