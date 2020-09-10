part of 'weather.dart';

@JsonSerializable()
class WindData {
  @JsonKey(name: 'speed')
  final double mpsSpeed;
  final double deg;

  @override
  String toString() => 'Wind{speed: $mpsSpeed, deg: $deg}';

  WindData({this.mpsSpeed, this.deg});

  factory WindData.fromJson(Map<String, dynamic> json) =>
      _$WindDataFromJson(json);

  Map<String, dynamic> toJson() => _$WindDataToJson(this);
}
