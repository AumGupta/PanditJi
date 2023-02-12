import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:pandit_ji/constants.dart';
import 'package:pandit_ji/rest_api/constants.dart';
import 'package:pandit_ji/rest_api/urls.dart';

dynamic fetchDataJSON(String url) async{
  final response = http.get(Uri.parse(url));
  final r = await response;
  log(r.body);
  return json.decode(r.body);
}

Future<void> fetchAllData() async{
  servicesData = await fetchDataJSON(getAllServicesUrl);
  productData = await fetchDataJSON(getAllProductsUrl);
}
