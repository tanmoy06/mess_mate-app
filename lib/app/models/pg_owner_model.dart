class PgOwnerModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? address;
  final String? password;
  final String? mobileNo;
  final String? pincode;
  final String? messName;
  final String? aboutMess;
  final Location? location;
  final String? geoHash;
  final String? profilePhoto;
  final List<String> messPhoto;
  final List<String> facility;
  final String gender;
  final List<RoomInfo> roomInfo;
  final List<String> rulesToStay;
  final int minimumSecurityDeposit;
  final String minimumBookingDuration;
  final bool isVerifiedOwner;
  final List<FeedbackModel> feedbacks;
  final String? googleId;
  final String? image;
  final String? createdAt;
  final List<RefreshToken> refreshTokens;

  PgOwnerModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.address,
    this.password,
    this.mobileNo,
    this.pincode,
    this.messName,
    this.aboutMess,
    this.location,
    this.geoHash,
    this.profilePhoto,
    this.messPhoto = const [],
    this.facility = const [],
    this.gender = "Coed Pg",
    this.roomInfo = const [],
    this.rulesToStay = const [],
    this.minimumSecurityDeposit = 0,
    this.minimumBookingDuration = "1 Month",
    this.isVerifiedOwner = false,
    this.feedbacks = const [],
    this.googleId,
    this.image,
    this.createdAt,
    this.refreshTokens = const [],
  });

  factory PgOwnerModel.fromJson(Map<String, dynamic> json) {
    return PgOwnerModel(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      address: json['address'],
      password: json['password'],
      mobileNo: json['mobileNo'],
      pincode: json['pincode'],
      messName: json['messName'],
      aboutMess: json['aboutMess'],
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      geoHash: json['geoHash'],
      profilePhoto: json['profilePhoto'],
      messPhoto: List<String>.from(json['messPhoto'] ?? []),
      facility: List<String>.from(json['facility'] ?? []),
      gender: json['gender'] ?? 'Coed Pg',
      roomInfo:
          (json['roomInfo'] as List<dynamic>? ?? [])
              .map((e) => RoomInfo.fromJson(e))
              .toList(),
      rulesToStay: List<String>.from(json['rulesToStay'] ?? []),
      minimumSecurityDeposit: json['minimumSecurityDeposit'] ?? 0,
      minimumBookingDuration: json['minimumBookingDuration'] ?? '1 Month',
      isVerifiedOwner: json['is_verified_Owner'] ?? false,
      feedbacks:
          (json['feedbacks'] as List<dynamic>? ?? [])
              .map((e) => FeedbackModel.fromJson(e))
              .toList(),
      googleId: json['googleId'],
      image: json['image'],
      createdAt: json['created_at'],
      refreshTokens:
          (json['refreshTokens'] as List<dynamic>? ?? [])
              .map((e) => RefreshToken.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
      'password': password,
      'mobileNo': mobileNo,
      'pincode': pincode,
      'messName': messName,
      'aboutMess': aboutMess,
      'location': location?.toJson(),
      'geoHash': geoHash,
      'profilePhoto': profilePhoto,
      'messPhoto': messPhoto,
      'facility': facility,
      'gender': gender,
      'roomInfo': roomInfo.map((e) => e.toJson()).toList(),
      'rulesToStay': rulesToStay,
      'minimumSecurityDeposit': minimumSecurityDeposit,
      'minimumBookingDuration': minimumBookingDuration,
      'is_verified_Owner': isVerifiedOwner,
      'feedbacks': feedbacks.map((e) => e.toJson()).toList(),
      'googleId': googleId,
      'image': image,
      'created_at': createdAt,
      'refreshTokens': refreshTokens.map((e) => e.toJson()).toList(),
    };
  }
}

class Location {
  final String type;
  final List<double> coordinates;
  final String geoHash;

  Location({
    required this.type,
    required this.coordinates,
    required this.geoHash,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'] ?? '',
      coordinates:
          (json['coordinates'] as List<dynamic>? ?? [])
              .map((e) => (e as num).toDouble())
              .toList(),
      geoHash: json['geoHash'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'coordinates': coordinates, 'geoHash': geoHash};
  }
}

class RoomInfo {
  final String room;
  final String bedContains;
  final int pricePerHead;
  final bool roomAvailable;

  RoomInfo({
    required this.room,
    required this.bedContains,
    required this.pricePerHead,
    required this.roomAvailable,
  });

  factory RoomInfo.fromJson(Map<String, dynamic> json) {
    return RoomInfo(
      room: json['room'] ?? '',
      bedContains: json['bedContains'] ?? '',
      pricePerHead: json['pricePerHead'] ?? 0,
      roomAvailable: json['roomAvailable'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'room': room,
      'bedContains': bedContains,
      'pricePerHead': pricePerHead,
      'roomAvailable': roomAvailable,
    };
  }
}

class FeedbackModel {
  final String stayId;
  final String username;
  final int rating;
  final String? comment;
  final String? submittedAt;

  FeedbackModel({
    required this.stayId,
    required this.username,
    required this.rating,
    this.comment,
    this.submittedAt,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      stayId: json['stayId'] ?? '',
      username: json['username'] ?? '',
      rating: json['rating'] ?? 0,
      comment: json['comment'],
      submittedAt: json['submittedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stayId': stayId,
      'username': username,
      'rating': rating,
      'comment': comment,
      'submittedAt': submittedAt,
    };
  }
}

class RefreshToken {
  final String token;
  final String device;
  final String? createdAt;

  RefreshToken({required this.token, required this.device, this.createdAt});

  factory RefreshToken.fromJson(Map<String, dynamic> json) {
    return RefreshToken(
      token: json['token'] ?? '',
      device: json['device'] ?? '',
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'device': device, 'createdAt': createdAt};
  }
}
