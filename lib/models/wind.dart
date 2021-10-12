class Wind {
  late num speed;
  late int deg;
  late num gust;

  Wind({required this.speed, required this.deg, required gust});

  Wind.fromJson(Map<String, dynamic> json) {
    print(json['speed']);
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}
