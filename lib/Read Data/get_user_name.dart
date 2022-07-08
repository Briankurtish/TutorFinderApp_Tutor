import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetJobPosts extends StatelessWidget {
  final String? documentId;

  GetJobPosts({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection

    CollectionReference jobs =
        FirebaseFirestore.instance.collection('tutorJobs');

    return FutureBuilder<DocumentSnapshot>(
      future: jobs.doc().get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Text('${data['title']}');
        }
        return Text("Loading....");
      },
    );
  }
}
