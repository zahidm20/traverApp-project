part of "model.dart";

Succses succsesFromJson(String str) => Succses.fromJson(json.decode(str));

String succsesToJson(Succses data) => json.encode(data.toJson());

class Succses {
  String status;
  String message;
  Data data;

  Succses({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Succses.fromJson(Map<String, dynamic> json) => Succses(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DataSucces {
  DataSucces();

  factory DataSucces.fromJson(Map<String, dynamic> json) => DataSucces();

  Map<String, dynamic> toJson() => {};
}
