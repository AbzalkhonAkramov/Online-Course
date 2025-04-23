import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/const/icons_path.dart';
import 'package:osnv/core/responsive/app_responsive.dart';
import '../../../authentication/presentation/widgets/custom_textfield.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(margin: EdgeInsets.only(left: 20) ,child: CircleAvatar()),
        title: Column(
          children: [
            Text("Good Morning 👋"),
            Text("Andrew Ainsley"),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.note)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomTextfield(
                controller: searchcontroller,
                hintText: "Search...",
                suffixIcon: Icon(Icons.settings),
              ),
              Gap(20),
              Container(
                height: appH(181),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.pagenation,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Mentors"),
                  TextButton(onPressed: () {}, child: Text("See All")),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(child: SvgPicture.asset(IconsPath.AppleIcon)),
                    Gap(20),
                    CircleAvatar(child: SvgPicture.asset(IconsPath.AppleIcon)),
                    Gap(20),
                    CircleAvatar(child: SvgPicture.asset(IconsPath.AppleIcon)),
                    Gap(20),
                    CircleAvatar(child: SvgPicture.asset(IconsPath.AppleIcon)),
                    Gap(20),
                    CircleAvatar(child: SvgPicture.asset(IconsPath.AppleIcon)),
                    Gap(20),
                    CircleAvatar(child: SvgPicture.asset(IconsPath.AppleIcon)),
                    Gap(20),
                    CircleAvatar(child: SvgPicture.asset(IconsPath.AppleIcon)),
                    Gap(20),
                    CircleAvatar(child: SvgPicture.asset(IconsPath.AppleIcon)),
                    Gap(20),
                    CircleAvatar(child: SvgPicture.asset(IconsPath.AppleIcon)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Most Popular Courses"),
                  TextButton(onPressed: () {}, child: Text("See All")),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
