part of 'weather_state.dart';

///Information about the Location for the displayed weather
@JsonSerializable(explicitToJson: true)
class LocationData extends Equatable {
  ///Name of the City for which weather is displayed
  final String name;
  ///A getter which splits the provided Name cut unnecessarily Long desciptions
  ///e.g. "Regierungsbezirk Gießen" -> "Gießen",
  ///"Arrondisement Marseille"->Marseille",
  ///"London" -> "London"
  String get cityName => name.split(" ").last;
  ///Coordinates of the City
  final Coordinates coord;
  ///ID of the city, as provided by the API
  @JsonKey(name: "id")
  final int cityID;
  ///Country in which the city lies
  final String country;
  ///Times of sunrise and sunset for the location
  final DateTime sunrise, sunset;

  // ignore: public_member_api_docs
  LocationData({
    this.coord = const Coordinates(),
    this.country = "Nothing",
    this.name = "Nowhere",
    this.cityID = -1,
    int sunrise = 0,
    int sunset = 0,
    int timezone = 0,
  })  : sunrise =
            DateTime.fromMillisecondsSinceEpoch(sunrise * 1000, isUtc: true) -
                timezone.seconds,
        sunset =
            DateTime.fromMillisecondsSinceEpoch(sunset * 1000, isUtc: true) -
                timezone.seconds;

  ///Factory which allows for deserializing a JSON-Map into a
  ///[LocationData] Object
  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  ///Method which allows serializing the [LocationData] into a JSON-Map
  Map<String, dynamic> toJson() => _$LocationDataToJson(this);

  @override
  String toString() => "$name, $country";

  @override
  List<Object> get props =>
      [name, cityID, cityName, coord, country, sunrise, sunset];
}
