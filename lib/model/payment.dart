part of "model.dart";

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  String status;
  String message;
  int count;
  List<DataPayment> data;

  Payment({
    required this.status,
    required this.message,
    required this.count,
    required this.data,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        data: List<DataPayment>.from(
            json["data"].map((x) => DataPayment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataPayment {
  int id;
  String namePayment;
  String gambarPayment;
  DateTime createdAt;
  DateTime updatedAt;

  DataPayment({
    required this.id,
    required this.namePayment,
    required this.gambarPayment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataPayment.fromJson(Map<String, dynamic> json) => DataPayment(
        id: json["id"],
        namePayment: json["name_payment"],
        gambarPayment: json["gambar_payment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_payment": namePayment,
        "gambar_payment": gambarPayment,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
