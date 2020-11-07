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

  ///Time of sunrise for the location
  DateTime get sunrise =>
      DateTime.fromMillisecondsSinceEpoch(_sunrise * 1000, isUtc: true) +
      timezone;

  ///Time of sunset for the location
  DateTime get sunset =>
      DateTime.fromMillisecondsSinceEpoch(_sunset * 1000, isUtc: true) +
      timezone;

  ///The duration the current timezone is behind UTC
  Duration get timezone => _timezone.seconds;

  final int _sunrise, _sunset, _timezone;

  // ignore: public_member_api_docs
  const LocationData({
    this.coord = const Coordinates(),
    this.country = "Nothing",
    this.name = "Nowhere",
    this.cityID = -1,
    int sunrise = 0,
    int sunset = 0,
    int timezone = 0,
  })  : _timezone = timezone,
        _sunrise = sunrise,
        _sunset = sunset;

  ///Factory which allows for deserializing a JSON-Map into a
  ///[LocationData] Object
  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  ///Method which allows serializing the [LocationData] into a JSON-Map
  Map<String, dynamic> toJson() => _$LocationDataToJson(this);

  @override
  String toString() => "$name, $country";

  @override
  List<Object> get props => [name, cityID, coord];
}
