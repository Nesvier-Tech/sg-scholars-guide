// TODO: [P3] Write test for OnlineTimeSourceEnum.

/// The source property is based on their real product names (in terms
/// of their capitalization, spacing, and punctuation).
enum OnlineTimeSourcesEnum {
  cloudFirestore('Cloud Firestore'),
  timeApi('TimeAPI'),
  timeZoneDb('timezonedb'),
  worldTimeApi('WorldTimeAPI'),
  semiOnline('Semi Online'),
  clientTime('Client Time'),
  other('Other');

  const OnlineTimeSourcesEnum(this.name);
  final String name;
}
