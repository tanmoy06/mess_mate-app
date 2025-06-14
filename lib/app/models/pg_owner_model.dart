// class PgOwnerModel {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String address;
//   final String password;
//   final String mobileNo;
//   final String pincode;
//   final String messName;
//   final String aboutMess;
//   final String gender;
//   final Location location;
//   final String profilePhoto;
//   final List<String> messPhoto;
//   final List<String> facility;
//   final List<dynamic> roomInfo;
//   final List<dynamic> rulesToStay;
//   final int minimumSecurityDeposit;
//   final String minimumBookingDuration;
//   final bool isVerifiedOwner;
//   final List<dynamic> feedbacks;

//   PgOwnerModel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.address,
//     required this.password,
//     required this.mobileNo,
//     required this.pincode,
//     required this.messName,
//     required this.aboutMess,
//     required this.gender,
//     required this.location,
//     required this.profilePhoto,
//     required this.messPhoto,
//     required this.facility,
//     required this.roomInfo,
//     required this.rulesToStay,
//     required this.minimumSecurityDeposit,
//     required this.minimumBookingDuration,
//     required this.isVerifiedOwner,
//     required this.feedbacks,
//   });

//   factory PgOwnerModel.fromJson(Map<String, dynamic> json) {
//     return PgOwnerModel(
//       id: json['_id'],
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//       email: json['email'],
//       address: json['address'],
//       password: json['password'],
//       mobileNo: json['mobileNo'],
//       pincode: json['pincode'],
//       messName: json['messName'],
//       aboutMess: json['aboutMess'],
//       gender: json['gender'],
//       location: Location.fromJson(json['location']),
//       profilePhoto: json['profilePhoto'],
//       messPhoto: List<String>.from(json['messPhoto']),
//       facility: List<String>.from(json['facility']),
//       roomInfo: List<dynamic>.from(json['roomInfo']),
//       rulesToStay: List<dynamic>.from(json['rulesToStay']),
//       minimumSecurityDeposit: json['minimumSecurityDeposit'],
//       minimumBookingDuration: json['minimumBookingDuration'],
//       isVerifiedOwner: json['is_verified_Owner'],
//       feedbacks: List<dynamic>.from(json['feedbacks']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'firstName': firstName,
//       'lastName': lastName,
//       'email': email,
//       'address': address,
//       'password': password,
//       'mobileNo': mobileNo,
//       'pincode': pincode,
//       'messName': messName,
//       'aboutMess': aboutMess,
//       'gender': gender,
//       'location': location.toJson(),
//       'profilePhoto': profilePhoto,
//       'messPhoto': messPhoto,
//       'facility': facility,
//       'roomInfo': roomInfo,
//       'rulesToStay': rulesToStay,
//       'minimumSecurityDeposit': minimumSecurityDeposit,
//       'minimumBookingDuration': minimumBookingDuration,
//       'is_verified_Owner': isVerifiedOwner,
//       'feedbacks': feedbacks,
//     };
//   }
// }

// class Location {
//   final String type;
//   final List<double> coordinates;
//   final String geoHash;

//   Location({
//     required this.type,
//     required this.coordinates,
//     required this.geoHash,
//   });

//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       type: json['type'],
//       coordinates: List<double>.from(json['coordinates']),
//       geoHash: json['geoHash'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {'type': type, 'coordinates': coordinates, 'geoHash': geoHash};
//   }
// }
class PgOwnerModel {
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
  final String gender;
  final Location location;
  final String profilePhoto;
  final List<String> messPhoto;
  final List<String> facility;
  final List<RoomInfo> roomInfo;
  final List<dynamic> rulesToStay;
  final int minimumSecurityDeposit;
  final String minimumBookingDuration;
  final bool isVerifiedOwner;
  final List<dynamic> feedbacks;

  PgOwnerModel({
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
    required this.gender,
    required this.location,
    required this.profilePhoto,
    required this.messPhoto,
    required this.facility,
    required this.roomInfo,
    required this.rulesToStay,
    required this.minimumSecurityDeposit,
    required this.minimumBookingDuration,
    required this.isVerifiedOwner,
    required this.feedbacks,
  });

  factory PgOwnerModel.fromJson(Map<String, dynamic> json) {
    return PgOwnerModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      address: json['address'],
      password: json['password'],
      mobileNo: json['mobileNo'],
      pincode: json['pincode'],
      messName: json['messName'],
      aboutMess: json['aboutMess'],
      gender: json['gender'],
      location: Location.fromJson(json['location']),
      profilePhoto: json['profilePhoto'],
      messPhoto: List<String>.from(json['messPhoto'] ?? []),
      facility: List<String>.from(json['facility'] ?? []),
      roomInfo:
          (json['roomInfo'] as List).map((e) => RoomInfo.fromJson(e)).toList(),
      rulesToStay: List<dynamic>.from(json['rulesToStay'] ?? []),
      minimumSecurityDeposit: json['minimumSecurityDeposit'],
      minimumBookingDuration: json['minimumBookingDuration'],
      isVerifiedOwner: json['is_verified_Owner'],
      feedbacks: List<dynamic>.from(json['feedbacks'] ?? []),
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
      'gender': gender,
      'location': location.toJson(),
      'profilePhoto': profilePhoto,
      'messPhoto': messPhoto,
      'facility': facility,
      'roomInfo': roomInfo.map((e) => e.toJson()).toList(),
      'rulesToStay': rulesToStay,
      'minimumSecurityDeposit': minimumSecurityDeposit,
      'minimumBookingDuration': minimumBookingDuration,
      'is_verified_Owner': isVerifiedOwner,
      'feedbacks': feedbacks,
    };
  }
}

class RoomInfo {
  final String roomId;
  final String room;
  final String bedContains;
  final int pricePerHead;
  final bool roomAvailable;

  RoomInfo({
    required this.roomId,
    required this.room,
    required this.bedContains,
    required this.pricePerHead,
    required this.roomAvailable,
  });

  factory RoomInfo.fromJson(Map<String, dynamic> json) {
    return RoomInfo(
      roomId: json['_id'],
      room: json['room'],
      bedContains: json['bedContains'],
      pricePerHead: json['pricePerHead'],
      roomAvailable: json['roomAvailable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': roomId,
      'room': room,
      'bedContains': bedContains,
      'pricePerHead': pricePerHead,
      'roomAvailable': roomAvailable,
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
      type: json['type'],
      coordinates: List<double>.from(json['coordinates']),
      geoHash: json['geoHash'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'coordinates': coordinates, 'geoHash': geoHash};
  }
}
