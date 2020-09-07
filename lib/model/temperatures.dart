class Temperatures {
  final double avg, feelsLike, min, max;

  Temperatures({
    this.avg,
    this.feelsLike,
    this.min,
    this.max,
  });

  @override
  String toString() =>
      'Temperatures{avg: $avg, feelsLike: $feelsLike, min: $min, max: $max}';
}
