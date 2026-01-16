class User {
  String? type,
      firstName,
      lastName,
      phone,
      birthday,
      profilePhoto,
      idPhoto,
      tokenFcm;
  User({
    this.type,
    this.firstName,
    this.lastName,
    this.phone,
    this.birthday,
    this.profilePhoto,
    this.idPhoto,
    this.tokenFcm,
  });
  User.fromJson(Map<String, dynamic> json) {
    type = json['role'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    birthday = json['birth_date'];
    profilePhoto = json['personal_photo'];
    idPhoto = json['identity_photo'];
    tokenFcm = json['token_fcm'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.type;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['profilePhoto'] = this.profilePhoto;
    data['idPhoto'] = this.idPhoto;
    data['token_fcm'] = this.tokenFcm;
    return data;
  }
}
