// ignore_for_file: unnecessary_this

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:tutor_side_app/logic/providers/tutor_auth_provider.dart';

import 'package:tutor_side_app/models/tutor_model.dart';

import 'package:tutor_side_app/screens/forgotPasswrd_page.dart';
import 'package:tutor_side_app/util/helper.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  late String categoryItem = '';
  late TutorModel tutorModel;
  late Authentication auth;
  final List<String> categoryItems = [
    'Secondary Education',
    'University Education',
  ];

  List<dynamic> categories = [];
  List<dynamic> stateMasters = [];
  List<dynamic> states = [];

  String? categoryId;
  String? stateId;

  @override
  void initState() {
    super.initState();

    auth = Provider.of<Authentication>(context, listen: false);
    tutorModel = auth.loggedUser!;

    dateinput.text = "";

    this.categories.add({"id": 1, "label": "Secondary Education"});
    this.categories.add({"id": 2, "label": "University Education"});

    this.stateMasters = [
      {"ID": 1, "Name": "Chemistry", "ParentId": 1},
      {"ID": 2, "Name": "Biology", "ParentId": 1},
      {"ID": 3, "Name": "Physics", "ParentId": 1},
      {"ID": 4, "Name": "Mathematics", "ParentId": 1},
      {"ID": 5, "Name": "Economics", "ParentId": 1},
      {"ID": 1, "Name": "Engineering", "ParentId": 2},
      {"ID": 2, "Name": "Accounting", "ParentId": 2},
      {"ID": 3, "Name": "Law", "ParentId": 2},
      {"ID": 4, "Name": "Medecine", "ParentId": 2},
    ];
  }

  String? selectedValue;
  // text controllers
  final _phoneNumController = TextEditingController();
  final _descriptionController = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Complete Registration",
                  style: GoogleFonts.poppins(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Consumer<Authentication>(builder: (_, auth, __) {
                  return Text(
                    'Hello ' + auth.loggedUser!.username,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  );
                }),
                const SizedBox(height: 10),
                const Text(
                  "Complete the following steps below to ste up your Tutor Profile",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select Your Category',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: categoryItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select Category.';
                    }
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                    setState(() {
                      categoryItem = value.toString();
                    });
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(height: 20),
                // Phone Number Textfield
                TextFormField(
                  controller: _phoneNumController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Enter Phone number',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // date of birth Field
                TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Select Date of birth",
                    icon: Icon(
                      Icons.calendar_today,
                      color: Colors.deepPurple,
                    ),
                    fillColor: Colors.grey[200],
                    filled: false,
                    //label text of field
                  ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            1990), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),

                const SizedBox(height: 30),
                // Description TextField
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Write a short description about yourself...',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }

                    tutorModel.phoneNumber = _phoneNumController.text.trim();
                    tutorModel.description = _descriptionController.text.trim();

                    tutorModel.dob = dateinput.text;
                    tutorModel.category = categoryItem.toString();
                    tutorModel.completedProfile = true;

                    showProgress(context, 'Completing Profile', true);
                    auth.completeProfile(tutorModel).then((value) {
                      hideProgress();
                      setState(() {});
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Complete Registration",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
