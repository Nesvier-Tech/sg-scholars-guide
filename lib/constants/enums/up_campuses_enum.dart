// TODO: [P3] Write test for UpCampusesEnum.
enum UpCampusesEnum {
  diliman('Diliman'),
  losBanos('Los Baños'),
  manila('Manila'),
  visayas('Visayas'),
  openUniversity('Open University'),
  mindanao('Mindanao'),
  baguio('Baguio'),
  cebu('Cebu');

  const UpCampusesEnum(this.name);
  final String name;
}
