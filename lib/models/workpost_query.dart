class WorkpostQuery {
  String search;
  List<String> amenities;
  int openForNextHours;
  double milesAway, minimumPrice, maximumPrice, minimumRating;

  WorkpostQuery(
      {required this.search,
      required this.amenities,
      required this.openForNextHours,
      required this.milesAway,
      required this.minimumPrice,
      required this.maximumPrice,
      required this.minimumRating});
}
