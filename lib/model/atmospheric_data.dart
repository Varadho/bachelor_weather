class AtmosphericData {
  final int pressure, humidity, clouds;
  final String description;

  AtmosphericData({
    this.pressure,
    this.humidity,
    this.clouds,
    this.description,
  });

  @override
  String toString() =>
      'AtmosphericData{pressure: $pressure, humidity: $humidity, '
      'clouds: $clouds, description: $description}';
}
