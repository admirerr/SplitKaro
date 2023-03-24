class FriendModel {
  String? uid1;
  String? uid2;
  String? amount;

  FriendModel({this.uid1, this.uid2, this.amount});

  // receiving data from server
  factory FriendModel.fromMap(map) {
    return FriendModel(
      uid1: map['uid1'],
      uid2: map['uid2'],
      amount: map['amount'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid1': uid1,
      'uid2': uid2,
      'amount': amount,
    };
  }
}
