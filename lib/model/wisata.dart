// To parse this JSON data, do
//
//     final wisata = wisataFromJson(jsonString);

part of 'model.dart';

Wisata wisataFromJson(String str) => Wisata.fromJson(json.decode(str));

String wisataToJson(Wisata data) => json.encode(data.toJson());

class Wisata {
  String status;
  String message;
  List<WisataList> data;

  Wisata({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        status: json["status"],
        message: json["message"],
        data: List<WisataList>.from(
            json["data"].map((x) => WisataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WisataList {
  int id;
  String namaWisata;
  String lokasiWisata;
  int ratingWisata;
  String deskripsiWisata;
  int hargaWisata;
  KategoriId kategoriId;
  String gambarWisata;
  bool favorit;

  WisataList({
    required this.id,
    required this.namaWisata,
    required this.lokasiWisata,
    required this.ratingWisata,
    required this.deskripsiWisata,
    required this.hargaWisata,
    required this.kategoriId,
    required this.gambarWisata,
    required this.favorit,
  });

  factory WisataList.fromJson(Map<String, dynamic> json) => WisataList(
        id: json["id"],
        namaWisata: json["nama_wisata"],
        lokasiWisata: json["lokasi_wisata"],
        ratingWisata: json["rating_wisata"],
        deskripsiWisata: json["deskripsi_wisata"],
        hargaWisata: json["harga_wisata"],
        kategoriId: KategoriId.fromJson(json["kategori_id"]),
        gambarWisata: json["gambar_wisata"],
        favorit: json["favorit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_wisata": namaWisata,
        "lokasi_wisata": lokasiWisata,
        "rating_wisata": ratingWisata,
        "deskripsi_wisata": deskripsiWisata,
        "harga_wisata": hargaWisata,
        "kategori_id": kategoriId.toJson(),
        "gambar_wisata": gambarWisata,
        "favorit": favorit,
      };
}

class KategoriId {
  int id;
  String namaKategori;

  KategoriId({
    required this.id,
    required this.namaKategori,
  });

  factory KategoriId.fromJson(Map<String, dynamic> json) => KategoriId(
        id: json["id"],
        namaKategori: json["nama_kategori"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
      };
}
