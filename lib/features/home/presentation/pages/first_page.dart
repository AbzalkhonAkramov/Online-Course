import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/responsive/app_responsive.dart';
import 'package:osnv/core/route/routename.dart';
import '../../../authentication/presentation/widgets/custom_textfield.dart';
import '../Bloc/Mentors/mentors_bloc.dart';
import '../Bloc/categories/categories_bloc.dart';
import '../Bloc/courses/courses_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController searchcontroller = TextEditingController();

  getcategories() {
    context.read<CategoriesBloc>().add(CategoriesEvent());
  }

  getmentor() {
    context.read<MentorsBloc>().add(MentorsEvent());
  }

  getCourses() {
    context.read<CoursesBloc>().add(CoursesEvent());
  }

  @override
  void initState() {
    getmentor();
    getcategories();
    getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: CircleAvatar(),
        ),
        title: Column(
          children: [Text("Good Morning 👋"), Text("Andrew Ainsley")],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.note)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              GestureDetector(
                child: CustomTextfield(
                  controller: searchcontroller,
                  hintText: "Search...",
                  suffixIcon: Icon(Icons.settings),
                ),
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
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.TopMentorsPage);
                    },
                    child: Text("See All"),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
                child: BlocBuilder<MentorsBloc, MentorsState>(
                  builder: (context, state) {
                    if (state is MentorsLoading) {
                      return CircularProgressIndicator();
                    } else if (state is MentorsLoaded) {
                      final responce = state.response.results.length;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: responce,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: appW(16)),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    state.response.results[index].avatarUrl
                                  ),
                                ),
                                Text(state.response.results[index].fullName),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state is MentorsError) {
                      return Text(state.message);
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Most Popular Courses"),
                  TextButton(onPressed: () {}, child: Text("See All")),
                ],
              ),
              SizedBox(
                height: 38,
                child: BlocBuilder<CategoriesBloc, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesLoading) {
                      return CircularProgressIndicator();
                    } else if (state is CategoriesLoaded) {
                      final categories = state.categories.results;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 12),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              child: Text(
                                categories[index].name,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is CategoriesError) {
                      return Text(state.message);
                    } else {
                      return Text("Something went wrong.");
                    }
                  },
                ),
              ),
              Gap(appH(30)),
              BlocBuilder<CoursesBloc, CoursesState>(
                builder: (context, state) {
                  if (state is CoursesLoading) {
                    return CircularProgressIndicator.adaptive();
                  } else if (state is CoursesLoaded) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.courses.results.length,
                      itemBuilder: (context, index) {
                        final courses = state.courses.results[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.CourseDetailPage,
                              arguments: courses.id,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black, // shadow color
                                  blurRadius: 10, // softness of the shadow
                                  offset: Offset(
                                    0,
                                    4,
                                  ), // position of the shadow
                                ),
                              ],
                            ),
                            width: appW(379),
                            child: Padding(
                              padding: EdgeInsets.all(appH(20)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),

                                    child: Image.network(
                                      courses.image,
                                      height: appW(120),
                                    ),
                                  ),
                                  Gap(appW(20)),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(courses.categoryName),
                                            Icon(Icons.bookmark),
                                          ],
                                        ),
                                        Text(
                                          courses.title,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text("\$${courses.price}"),
                                        Row(
                                          children: [
                                            Icon(Icons.star),
                                            Text("asssaaa | asdfgh"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is CoursesError) {
                    return Text(state.message);
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
