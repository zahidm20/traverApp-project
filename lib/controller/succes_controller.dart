// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, unused_import, unused_local_variable, avoid_print
import "dart:convert";

import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";
import "package:travel_app/model/model.dart";
import 'package:intl/intl.dart';

class SuccsesController {
  Future SuccsesProses(
      String date_booking,
      String id_wisata,
      String name_booking,
      String contact_booking,
      int qty_booking,
      bool status_booking,
      int id_payment) async {
    String url = "${dotenv.env['IP']}/booking/create";
    Uri urlData = Uri.parse(url);

    // final dateFormat = DateForm"at('dd-MM-yyyy');
    // var parsedDate = DateTime.parse(date_booking.toString());
    // print(dateFormat.format(parsedDate));"

    Map data = {
      "date_booking": date_booking,
      "id_wisata": int.parse(id_wisata),
      "name_booking": name_booking,
      "contact_booking": contact_booking,
      "qty_booking": qty_booking,
      "status_booking": false,
      "id_payment": id_payment,
    };

    var body = json.encode(data);
    print(body);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString("TOKEN").toString());
    String token = "Bearer ${dataUser.data.accessToken}";

    final respon = await http.post(urlData,
        headers: {"Authorization": token, "Content-Type": "application/json"},
        body: body);

    print(respon.body);
    if (respon.statusCode == 201) {
      Succses dataRes = succsesFromJson(respon.body.toString());
      return dataRes;
    } else {
      return null;
    }
  }
}
