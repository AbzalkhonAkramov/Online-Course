import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:osnv/core/const/text_style.dart';
import 'package:osnv/features/auth/register/presentation/widgets/custom_button.dart';
import 'package:osnv/features/auth/register/presentation/widgets/custom_textfield.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/responsive/app_responsive.dart';

class FillProfile extends StatefulWidget {
  FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  late Box box;
  String? selectedGender;
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  late bool isActive = false;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    box = Hive.box('settings');
    _loadImagePath();
    focusNode.addListener(() {
      setState(() {
        isActive = focusNode.hasFocus;
      });
    });
  }

  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      String formattedDate = DateFormat('d MMMM y').format(picked);
      setState(() {
        dateController.text = formattedDate;
      });
    }
  }

  void _loadImagePath() {
    final path = box.get('avatar_path');
    if (path != null) {
      setState(() {
        _imageFile = File(path);
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
      // Save the path to Hive
      box.put('avatar_path', pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: appH(886),
          width: appW(428),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appW(40),
              vertical: appH(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                    Text("Fill Your Profile", style: upTextStyle),
                  ],
                ),
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: appW(80),
                    backgroundImage:
                        _imageFile != null ? FileImage(_imageFile!) : null,
                    child:
                        _imageFile == null
                            ? Icon(Icons.camera_alt, size: 40)
                            : null,
                  ),
                ),
                CustomTextfield(
                  controller: fullnameController,
                  hintText: "Full name",
                ),
                CustomTextfield(
                  controller: nicknameController,
                  hintText: "Nick name",
                ),
                CustomTextfield(
                  controller: dateController,
                  hintText: "Date of Birth",
                  readonly: true,
                  onTab: () => _selectDate(context),
                  suffixIcon: Icon(Icons.date_range),
                ),
                CustomTextfield(
                  controller: emailController,
                  hintText: "Email",
                  suffixIcon: Icon(Icons.email),
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textfiledcolor,
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.pagenation, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  initialCountryCode: 'US',
                  onChanged: (phone) {
                    print(
                      phone.completeNumber,
                    ); // Full number with country code
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Gender",
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.pagenation),
                    ),
                    focusColor: AppColors.trasperentblue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  value: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  items:
                      genderOptions.map((gender) {
                        return DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                ),
                SignCustomButton(onPressed: () {}, text: "Continue"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
