import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:tutor_side_app/logic/providers/tutor_auth_provider.dart';
import 'package:tutor_side_app/models/tutor_jobs.dart';
import 'package:tutor_side_app/services/crud.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tutor_side_app/util/helper.dart';

class CreateJob extends StatefulWidget {
  const CreateJob({Key? key}) : super(key: key);

  @override
  State<CreateJob> createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  final db = FirebaseFirestore.instance;
  late Authentication auth;

  @override
  void initState() {
    super.initState();
    auth = Provider.of<Authentication>(context, listen: false);

    // crudMethods.getData().then((results) {
    //   jobSnapshot = results;
    // });
  }

  // Text contorllers
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  String? category,
      title,
      authorName,
      address,
      description,
      phoneNumber,
      subjects;

  File? selectedImage;
  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  CrudMethods crudMethods = CrudMethods();

  // Future getImage() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     selectedImage = File(image!.path);
  //   });
  // }

  uploadPost() async {
    if (selectedImage != null) {
      setState(() {
        isLoading = true;
      });
      //Uploading an Image to Firebase Storage

      Reference ref = FirebaseStorage.instance
          .ref()
          .child("jobImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      await ref.putFile(selectedImage!);
      ref.getDownloadURL().then((value) {
        //imageUrl = value;
      });
    } else {}
  }

  uploadJob() {
    //showProgress(context, 'Creating Job', true);
    db.collection("tutorJobs").add(
      {
        //'imageUrl': ,
        'jobTitle': titleController.text.trim(),
        'subject': subjectController.text.trim(),
        'address': addressController.text.trim(),
        'author': authorController.text.trim(),
        'phoneNumber': titleController.text.trim(),
        'description': descriptionController.text.trim(),
      },
    );

    showSnackBar(context, "Job was Created Successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff404040),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Create",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            Text(
              "Post",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              uploadJob();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.upload,
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      "assets/logo_finder.png",
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            key: formkey,
                            controller: titleController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "Job Title",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onChanged: (val) {
                              title = val;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: subjectController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "Subject",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onChanged: (val) {
                              subjects = val;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: addressController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "Address",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onChanged: (val) {
                              address = val;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: authorController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "Tutor Name",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onChanged: (val) {
                              authorName = val;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: phoneNumController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "Phone Number",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onChanged: (val) {
                              phoneNumber = val;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: descriptionController,
                            maxLines: 10,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              hintText:
                                  'Write a short description about yourself...',
                              hintStyle: const TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onChanged: (val) {
                              description = val;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
