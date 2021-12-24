class Location {
  double? latiTude;
  double? longiTude;
  Location(double? latiTude, double? longiTude);

  Location.fromJson(Map<String, dynamic> json)
      : latiTude = json["latitude"],
        longiTude = json["longitude"];
}

class Pharmacy {
  String? phName;
  late Location locationPH;
  late List<String> dayDuty;
  bool isDuty = true;
  getDays(String name) {
    return dayDuty;
  }

  String? phone;
  Pharmacy.fromJson(Map<String, dynamic> json) {
    phName = json["name"];
    phone = json["Phone"];
    locationPH = Location.fromJson(json["location"]);
    isDuty = json["is duty"];
    dayDuty = (json["days of duty"] as List).map((e) => e.toString()).toList();
  }
}

class City {
  late Location finalLocation;
  String? cityName;
  List<Pharmacy> pharmacies = [];
  City.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    finalLocation = Location.fromJson(json["location"]);
    for (var ph in (json["Pharmacies"] as List<dynamic>)) {
      pharmacies.add(Pharmacy.fromJson(ph));
    }
  }
}
