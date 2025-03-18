class BarberModel {
  final int id;
  final String name;
  final int averageRating;
  final String profilePic;
  final String address;
  final List<BarberServies>? barberServies;
  // final UserAvailability? userAvailability;
  // final List<Reviews>? reviews;

  BarberModel({
    required this.id,
    required this.name,
    required this.averageRating,
    required this.profilePic,
    required this.address,
    required this.barberServies,
    // required this.userAvailability,
    // required this.reviews,
  });

  factory BarberModel.fromJson(Map<String, dynamic> json) {
    return BarberModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      averageRating: json['averageRating'] ?? 0,
      profilePic: json['profilePic'] ?? '',
      address: json['address'] ?? '',
      barberServies:
          json['barberServies']?.map((v) => BarberServies.fromJson(v)).toList(),
      // userAvailability: UserAvailability.fromJson(json['userAvailability'])
      // reviews: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }
}

class Reviews {}

class UserAvailability {
  AvailableDays? availableDays;

  UserAvailability({required this.availableDays});

  factory UserAvailability.fromJson(Map<String, dynamic> json) {
    return UserAvailability(
        availableDays: AvailableDays.fromJson(json['availableDays']));
  }
}

class AvailableDays {
  List<Day>? fri;
  List<Day>? mon;
  List<Day>? sat;
  List<Day>? sun;
  List<Day>? thu;
  List<Day>? tue;
  List<Day>? wed;

  AvailableDays(
      {this.fri, this.mon, this.sat, this.sun, this.thu, this.tue, this.wed});

  AvailableDays.fromJson(Map<String, dynamic> json) {
    (
      fri: json['Fri'].forEach((v) {
        fri!.add(Day.fromJson(v));
      }),
      mon: json['Mon'].forEach((v) {
        mon!.add(Day.fromJson(v));
      }),
      sat: json['Sat'].forEach((v) {
        sat!.add(Day.fromJson(v));
      }),
      sun: json['Sun'].forEach((v) {
        sun!.add(Day.fromJson(v));
      }),
      thu: json['Thu'].forEach((v) {
        thu!.add(Day.fromJson(v));
      }),
      tue: json['Tue'].forEach((v) {
        tue!.add(Day.fromJson(v));
      }),
      wed: json['Wed'].forEach((v) {
        wed!.add(Day.fromJson(v));
      }),
    );
  }
}

class Day {
  final String? day;
  final String? start;
  final String? end;

  Day({required this.day, required this.start, required this.end});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      day: json['day'] ?? '',
      start: json['start'] ?? '',
      end: json['end'] ?? '',
    );
  }
}

class BarberServies {
  final int? price;
  final String? categoryName;
  final String? categoryIcon;

  BarberServies({
    required this.price,
    required this.categoryName,
    required this.categoryIcon,
  });

  factory BarberServies.fromJson(Map<String, dynamic> json) {
    return BarberServies(
      price: json['servicePrice'] ?? '',
      categoryName: json['servicePrice']['category']['categoryName'] ?? '',
      categoryIcon: json['servicePrice']['category']['categoryIcon'] ?? '',
    );
  }
}
