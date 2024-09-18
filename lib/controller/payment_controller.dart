// ignore_for_file: file_names, prefer_const_constructors
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";
import "package:travel_app/model/model.dart";

class PaymentController {
  Future getPayment() async {
    await Future.delayed(Duration(seconds: 3));
    String url = "${dotenv.env['IP']}/payment/list";
    Uri urlData = Uri.parse(url);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString("TOKEN").toString());
    String token = "Bearer ${dataUser.data.accessToken}";

    final respon = await http.get(urlData, headers: {"Authorization": token});

    if (respon.statusCode == 200) {
      Payment data = paymentFromJson(respon.body);
      return data.data;
    } else {
      return null;
    }
  }
}
