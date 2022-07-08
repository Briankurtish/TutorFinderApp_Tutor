import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor_side_app/logic/providers/tutor_auth_provider.dart';
import 'package:tutor_side_app/models/tutor_jobs.dart';
import 'package:tutor_side_app/screens/jobDetails.dart';

class JobPosts extends StatefulWidget {
  const JobPosts({Key? key}) : super(key: key);

  @override
  State<JobPosts> createState() => _JobPostsState();
}

class _JobPostsState extends State<JobPosts> {
  late Authentication auth;
  List<TutorJobsModel> jobItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = Provider.of<Authentication>(context, listen: false);
    fetchRecords();
  }

  fetchRecords() async {
    var records =
        await FirebaseFirestore.instance.collection("tutorJobs").get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (jobItem) => TutorJobsModel(
            uid: jobItem.id,
            jobTitle: jobItem['jobTitle'],
            subjects: jobItem['subject'],
            description: jobItem['description'],
            address: jobItem['address'],
            author: jobItem['author'],
            phoneNumber: jobItem['phoneNumber'],
          ),
        )
        .toList();

    setState(() {
      jobItems = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Job Posts",
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: jobItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => JobDetails())));
              },
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepPurple),
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  leading: CircleAvatar(
                    child: Text(
                      jobItems[index].jobTitle[0],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  title: Text(jobItems[index].jobTitle),
                  subtitle: Text(jobItems[index].address),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// Text(jobItems[index].jobTitle),
