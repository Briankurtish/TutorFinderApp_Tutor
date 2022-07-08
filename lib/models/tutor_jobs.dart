class TutorJobsModel {
  String uid;
  String jobTitle;
  String author;
  String phoneNumber;
  String address;
  String description;
  String category;
  String subjects;

  TutorJobsModel({
    this.uid = '',
    this.jobTitle = '',
    this.author = '',
    this.address = '',
    this.phoneNumber = '',
    this.description = '',
    this.category = '',
    this.subjects = '',
  });

  factory TutorJobsModel.fromJson(Map<String, dynamic> json) {
    return TutorJobsModel(
      uid: json['uid'],
      jobTitle: json['jobTitle'],
      author: json['author'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      description: json['description'],
      category: json['category'],
      subjects: json['subjects'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'jobTitle': jobTitle,
      'author': author,
      'phoneNumber': phoneNumber,
      'address': address,
      'description': description,
      'category': category,
      'subjects': subjects,
    };
  }
}
