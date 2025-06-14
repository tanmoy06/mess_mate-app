class MessUserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String password;
  final String mobileNo;
  final String pincode;
  final String messName;
  final String aboutMess;
  final String geoHash;
  final String profilePhoto;
  final List<String> messPhoto;
  final Location location;

  MessUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.password,
    required this.mobileNo,
    required this.pincode,
    required this.messName,
    required this.aboutMess,
    required this.geoHash,
    required this.profilePhoto,
    required this.messPhoto,
    required this.location,
  });

  factory MessUserModel.fromJson(Map<String, dynamic> json) {
    return MessUserModel(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      password: json['password'] ?? '',
      mobileNo: json['mobileNo'] ?? '',
      pincode: json['pincode'] ?? '',
      messName: json['messName'] ?? '',
      aboutMess: json['aboutMess'] ?? '',
      geoHash: json['geoHash'] ?? '',
      profilePhoto: json['profilePhoto'] ?? '',
      messPhoto:
          json['messPhoto'] != null ? List<String>.from(json['messPhoto']) : [],
      location: Location.fromJson(json['location'] ?? {}),
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    final coords = json['coordinates'];
    return Location(
      type: json['type'] ?? '',
      coordinates:
          coords is List
              ? List<double>.from(coords.map((x) => (x as num).toDouble()))
              : [],
    );
  }
}
