class SearchModal {
  String name;
  String lon;
  String lat;

  SearchModal({
    required this.name,
    required this.lon,
    required this.lat,
  });

  factory SearchModal.fromJson(Map<String, dynamic> json) => SearchModal(
        name: json["name"],
        lon: json["lon"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lon": lon,
        "lat": lat,
      };
}
