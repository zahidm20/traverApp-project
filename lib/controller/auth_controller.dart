import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/model/model.dart';

class AuthController {
  static String url = '${dotenv.env['IP']}';

  Future registerProses(String nama, String email, String password,
      String konfirmasiPassword) async {
    try {
      Uri urlData = Uri.parse('$url/auth/register');

      Map data = {
        "nama": nama,
        "email": email,
        "password": password,
        "konfirmasiPassword": konfirmasiPassword
      };

      var body = json.encode(data);

      final response = await http.post(urlData,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 201) {
        // log(response.body);
        Register dataResponse = registerFromJson(response.body.toString());
        return dataResponse;
      } else {
        return null;
      }
    } catch (e) {
      log("error -> $e");
    }
  }

  Future loginProses(String email, String password) async {
    try {
      Uri urlData = Uri.parse('$url/auth/login');

      Map data = {
        "email": email,
        "password": password,
      };

      var body = json.encode(data);

      final response = await http.post(urlData,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 201) {
        // log(response.body);

        Login loginRes = loginFromJson(response.body);

        // String token = loginRes.data.accessToken;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('TOKEN', response.body);
        // log(response.body);

        return loginRes;
      } else {
        throw Exception();
      }
    } catch (e) {
      log('Error -> $e');
    }
  }

  Future forgotPassword(String email) async {
    try {
      Uri urlData = Uri.parse('$url/auth/lupa-password');

      Map data = {
        "email": email,
      };

      var body = json.encode(data);

      final response = await http.post(urlData,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 201) {
        ForgotPassword forgotRes = forgotPasswordFromJson(response.body);
        return forgotRes;
      } else {
        return null;
      }
    } catch (e) {
      log('Error -> $e');
    }
  }

  Future logOut(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('TOKEN');

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
