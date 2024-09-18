part of 'model.dart';

class Pagination {
  int page;
  int pageSize;

  Pagination({
    required this.page,
    required this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
      };
}
