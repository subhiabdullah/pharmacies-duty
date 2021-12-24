// ignore: file_names
import 'package:http/http.dart' as http;
import 'package:pharmacies/models/pharmacies.dart';
import 'dart:convert';

Future<List<City>> getPharmacies() async {
  List<City> result = [];
  String url =
      'https://ad1f4ab7-6b0a-4929-8821-5a1519d53df3.mock.pstmn.io/json';
  http.Response response = await http.get(
    Uri.parse(url),
  );
  List<dynamic> data = json.decode(response.body);
  if (response.statusCode == 200) {
    for (var city in data) {
      result.add(City.fromJson(city));
    }
  } else {}
  return result;
}

List<Pharmacy> getDutyPharmacies(List<City> cities, String day) {
  List<Pharmacy> result = [];
  for (var c in cities) {
    for (var ph in c.pharmacies) {
      if (ph.dayDuty.contains(day)) {
        result.add(ph);
      }
    }
  }
  return result;
}

Location getCity(List<City> cities, String name) {
  for (var c in cities) {
    if (c.cityName == name) {
      return c.finalLocation;
    }
  }
  return Location(0.0, 0.0);
}

String getToday() {
  String res = "";
  var t = DateTime.now().weekday;
  switch(t){
    case 1:
      res = "Monday";
      break;
    case 2:
      res = "Tuesday";
      break;
    case 3:
      res = "Wednesday";
      break;
    case 4:
      res = "Thursday";
      break;
    case 5:
      res = "Friday";
      break;
    case 6:
      res = "Saturday";
      break;
    case 7:
      res = "Sunday";
      break;
    default:
      break;
  }
  return res;
}
