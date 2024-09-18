part of "model.dart";

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
    String status;
    String message;
    int count;
    List<DataKategori> data;
    Pagination pagination;

    Kategori({
        required this.status,
        required this.message,
        required this.count,
        required this.data,
        required this.pagination,
    });

    factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        data: List<DataKategori>.from(json["data"].map((x) => DataKategori.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class DataKategori {
    int id;
    String namaKategori;
    String gambarKategori;
    CreatedBy createdBy;
    dynamic updatedBy;

    DataKategori({
        required this.id,
        required this.namaKategori,
        required this.gambarKategori,
        required this.createdBy,
        required this.updatedBy,
    });

    factory DataKategori.fromJson(Map<String, dynamic> json) => DataKategori(
        id: json["id"],
        namaKategori: json["nama_kategori"],
        gambarKategori: json["gambar_kategori"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
        updatedBy: json["updated_by"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
        "gambar_kategori": gambarKategori,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy,
    };
}

class CreatedBy {
    int id;
    String nama;

    CreatedBy({
        required this.id,
        required this.nama,
    });

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
    };
}