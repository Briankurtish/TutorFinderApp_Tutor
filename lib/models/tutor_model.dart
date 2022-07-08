class TutorModel {
  bool completedProfile;
  String uid;
  String username;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String address;
  String dob;
  String description;
  String category;

  TutorModel({
    this.uid = '',
    this.username = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.address = '',
    this.phoneNumber = '',
    this.dob = '',
    this.description = '',
    this.category = '',
    this.completedProfile = false,
  });

  factory TutorModel.fromJson(Map<String, dynamic> json) {
    return TutorModel(
      uid: json['uid'],
      completedProfile: json['completedProfile'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      dob: json['dob'],
      description: json['description'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'completedProfile': completedProfile,
      'uid': uid,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'dob': dob,
      'description': description,
      'category': category,
    };
  }
}
