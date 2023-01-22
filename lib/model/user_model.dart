class UserModel {
  String? uid;
  String? email;
  String? name;
  String? phoneNumber;

  UserModel({this.uid, this.email, this.name, this.phoneNumber});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
