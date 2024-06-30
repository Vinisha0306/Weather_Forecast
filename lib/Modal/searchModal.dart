class Search {
  String type;
  Properties properties;
  Geometry geometry;
  List<double> bbox;

  Search({
    required this.type,
    required this.properties,
    required this.geometry,
    required this.bbox,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        type: json["type"],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
        bbox: List<double>.from(json["bbox"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
      };
}

class Geometry {
  String type;
  List<double> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Properties {
  Datasource datasource;
  String name;
  String country;
  String countryCode;
  String state;
  String stateDistrict;
  String county;
  String city;
  String postcode;
  double lon;
  double lat;
  String stateCode;
  String resultType;
  String formatted;
  String addressLine1;
  String addressLine2;
  String category;
  Timezone timezone;
  String plusCode;
  Rank rank;
  String placeId;

  Properties({
    required this.datasource,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.state,
    required this.stateDistrict,
    required this.county,
    required this.city,
    required this.postcode,
    required this.lon,
    required this.lat,
    required this.stateCode,
    required this.resultType,
    required this.formatted,
    required this.addressLine1,
    required this.addressLine2,
    required this.category,
    required this.timezone,
    required this.plusCode,
    required this.rank,
    required this.placeId,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        datasource: Datasource.fromJson(json["datasource"]),
        name: json["name"] ?? '',
        country: json["country"],
        countryCode: json["country_code"],
        state: json["state"],
        stateDistrict: json["state_district"] ?? "",
        county: json["county"] ?? "",
        city: json["city"],
        postcode: json["postcode"] ?? "",
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        stateCode: json["state_code"] ?? "",
        resultType: json["result_type"],
        formatted: json["formatted"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        category: json["category"] ?? "",
        timezone: Timezone.fromJson(json["timezone"]),
        plusCode: json["plus_code"],
        rank: Rank.fromJson(json["rank"]),
        placeId: json["place_id"],
      );

  Map<String, dynamic> toJson() => {
        "datasource": datasource.toJson(),
        "name": name,
        "country": country,
        "country_code": countryCode,
        "state": state,
        "state_district": stateDistrict,
        "county": county,
        "city": city,
        "postcode": postcode,
        "lon": lon,
        "lat": lat,
        "state_code": stateCode,
        "result_type": resultType,
        "formatted": formatted,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "category": category,
        "timezone": timezone.toJson(),
        "plus_code": plusCode,
        "rank": rank.toJson(),
        "place_id": placeId,
      };
}

class Datasource {
  String sourcename;
  String attribution;
  String license;
  String url;

  Datasource({
    required this.sourcename,
    required this.attribution,
    required this.license,
    required this.url,
  });

  factory Datasource.fromJson(Map<String, dynamic> json) => Datasource(
        sourcename: json["sourcename"],
        attribution: json["attribution"],
        license: json["license"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sourcename": sourcename,
        "attribution": attribution,
        "license": license,
        "url": url,
      };
}

class Rank {
  double importance;
  double popularity;
  double confidence;
  double confidenceCityLevel;
  String matchType;

  Rank({
    required this.importance,
    required this.popularity,
    required this.confidence,
    required this.confidenceCityLevel,
    required this.matchType,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        importance: (json["importance"] ?? 0.0),
        popularity: json["popularity"]?.toDouble(),
        confidence: json["confidence"]?.toDouble(),
        confidenceCityLevel: json["confidence_city_level"]?.toDouble(),
        matchType: json["match_type"],
      );

  Map<String, dynamic> toJson() => {
        "importance": importance,
        "popularity": popularity,
        "confidence": confidence,
        "confidence_city_level": confidenceCityLevel,
        "match_type": matchType,
      };
}

class Timezone {
  String name;
  String offsetStd;
  int offsetStdSeconds;
  String offsetDst;
  int offsetDstSeconds;
  String abbreviationStd;
  String abbreviationDst;

  Timezone({
    required this.name,
    required this.offsetStd,
    required this.offsetStdSeconds,
    required this.offsetDst,
    required this.offsetDstSeconds,
    required this.abbreviationStd,
    required this.abbreviationDst,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        name: json["name"],
        offsetStd: json["offset_STD"],
        offsetStdSeconds: json["offset_STD_seconds"],
        offsetDst: json["offset_DST"],
        offsetDstSeconds: json["offset_DST_seconds"],
        abbreviationStd: json["abbreviation_STD"] ?? "",
        abbreviationDst: json["abbreviation_DST"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "offset_STD": offsetStd,
        "offset_STD_seconds": offsetStdSeconds,
        "offset_DST": offsetDst,
        "offset_DST_seconds": offsetDstSeconds,
        "abbreviation_STD": abbreviationStd,
        "abbreviation_DST": abbreviationDst,
      };
}
