// TODO: [P3] Write test for OnlineTimeSourceEnum.
/// The source property is based on their real product names (in terms
/// of their capitalization, spacing, and punctuation).
enum OnlineTimeSourceEnum {
  timeApi('TimeAPI'),
  timeZoneDb('timezonedb'),
  worldTimeApi('WorldTimeAPI'),
  semiOnline('Semi Online'),
  clientTime('Client Time');

  const OnlineTimeSourceEnum(this.source);
  final String source;
}
