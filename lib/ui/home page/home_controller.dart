import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/model/model.dart';

class HomeController {
  static final String _baseUrl = '${dotenv.env['IP']}';

  Future getUserName() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Login dataUser = loginFromJson(prefs.getString('TOKEN').toString());
      return dataUser.data.nama;
    } catch (e) {
      log('Error -> $e');
    }
  }

  Future getKategori() async {
    await Future.delayed(const Duration(seconds: 2));
    String url = "${dotenv.env['IP']}/kategori/list";
    Uri urlData = Uri.parse(url);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString("TOKEN").toString());
    String token = "Bearer ${dataUser.data.accessToken}";

    final respon = await http.get(urlData, headers: {"Authorization": token});

    if (respon.statusCode == 200) {
      Kategori data = kategoriFromJson(respon.body);
      return data.data;
    } else {
      return null;
    }
  }

  Future getWisata() async {
    await Future.delayed(const Duration(seconds: 2));
    String url = "${dotenv.env['IP']}/wisata/list";
    Uri urlData = Uri.parse(url);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Login dataUser = loginFromJson(prefs.getString('TOKEN').toString());
    String token = 'Bearer ${dataUser.data.accessToken}';

    final response = await http.get(urlData, headers: {'Authorization': token});

    if (response.statusCode == 200) {
      Wisata data = wisataFromJson(response.body);
      return data.data;
    } else {
      return null;
    }
  }
}
