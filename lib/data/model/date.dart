class Date {
  Date({
    required this.date,
  });

  String date;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
      };
}
