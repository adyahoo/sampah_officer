import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_html/flutter_html.dart';
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:sampah_officer/data/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'input_sampah_service.dart';
part 'user_services.dart';
part 'transaksi_service.dart';
part 'common_service.dart';

String TOKEN = 'TOKEN';
String USER_BOX = 'PETUGAS_BOX';
// String baseUrlLocal = 'http://10.0.2.2:8000/api/petugas';
String baseUrlImg = 'https://admin.gunabangsahmmunud.com';
String baseUrl = 'https://admin.gunabangsahmmunud.com/api/petugas';

Future<void> setUserPref({String? token}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(TOKEN, token!);
}

Future<String?> getUserToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString(TOKEN);
  return token;
}

void setLocalUser(UserModel user) async {
  await Hive.openBox(USER_BOX);
  var userBox = Hive.box(USER_BOX);
  userBox.put('user', user);
}

Future<UserModel> getLocalUser() async {
  await Hive.openBox(USER_BOX);
  var userBox = Hive.box(USER_BOX);
  UserModel userData = userBox.get('user');
  return userData;
}

void deleteLocalUser() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();

  await Hive.openBox(USER_BOX);
  var userBox = Hive.box(USER_BOX);
  userBox.clear();
  // userBox.close();
}

String convertCurrency(String? money) {
  return new NumberFormat.currency(locale: 'id',symbol: 'Rp. ').format(int.parse(money!));
}