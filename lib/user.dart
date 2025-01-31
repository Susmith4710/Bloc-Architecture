class User {
  String year;
  // ignore: non_constant_identifier_names
  String new_york_city_population;
  // ignore: non_constant_identifier_names
  String nyc_consumption_million_gallons_per_day;
  // ignore: non_constant_identifier_names
  User({required this.year, required this.new_york_city_population,required this.nyc_consumption_million_gallons_per_day});

  factory User.dummy() => User(year: "", new_york_city_population: "", nyc_consumption_million_gallons_per_day: "");


  factory User.fromJson(Map<String, dynamic> json) => User(
        new_york_city_population: json["new_york_city_population"],
       year:json["year"],
        nyc_consumption_million_gallons_per_day: json["nyc_consumption_million_gallons_per_day"],
      );
}
