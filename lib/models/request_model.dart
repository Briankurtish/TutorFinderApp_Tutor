class RequestModel {
  String uid;
  String requestTitle;
  String author;
  String phoneNumber;
  String address;

  String category;
  String subjects;

  RequestModel({
    this.uid = '',
    this.requestTitle = '',
    this.author = '',
    this.address = '',
    this.phoneNumber = '',
    this.category = '',
    this.subjects = '',
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      uid: json['uid'],
      requestTitle: json['requestTitle'],
      author: json['author'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      category: json['category'],
      subjects: json['subjects'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'requestTitle': requestTitle,
      'author': author,
      'phoneNumber': phoneNumber,
      'address': address,
      'category': category,
      'subjects': subjects,
    };
  }
}
