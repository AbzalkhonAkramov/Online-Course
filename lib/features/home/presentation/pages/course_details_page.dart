import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/couresesByDetails/courses_by_details_bloc.dart';

class CourseDetailPage extends StatefulWidget {
  final id;

  const CourseDetailPage({super.key, required this.id});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  getCourseByDetails() {
    context.read<CoursesByDetailsBloc>().add(FetchProduct(id: widget.id));
  }

  @override
  void initState() {
    getCourseByDetails();
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoursesByDetailsBloc, CoursesByDetailsState>(
        builder: (context, state) {
          if (state is CoursesByDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CoursesByDetailsLoaded) {
            final courses = state.coursesResult;
            return Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      courses.image,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            BackButton(color: Colors.white),
                            Icon(Icons.more_vert, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              courses.description,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Chip(
                                  label: Text(courses.categoryName),
                                  backgroundColor: Colors.blue.shade50,
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                Text("4.8 (4,479 reviews)"),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "\$${courses.price}",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "\$75",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: const [
                                Icon(Icons.group, size: 16),
                                SizedBox(width: 4),
                                Text("9,839 Students"),
                                SizedBox(width: 16),
                                Icon(Icons.timer, size: 16),
                                SizedBox(width: 4),
                                Text("2.5 Hours"),
                                SizedBox(width: 16),
                                Icon(Icons.verified, size: 16),
                                SizedBox(width: 4),
                                Text("Certificate"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(text: "About"),
                          Tab(text: "Lessons"),
                          Tab(text: "Reviews"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // About Tab
                            SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(
                                          'https://s3-symbol-logo.tradingview.com/apple--600.png',
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Jonathan Williams",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Senior UI/UX Designer at Google",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    "About Course",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Read more...",
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    "Tools",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Chip(label: Text("Figma")),
                                ],
                              ),
                            ),
                            // Lessons Tab
                            ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text("${index + 1}"),
                                    ),
                                    title: Text("Lesson ${index + 1}"),
                                    subtitle: Text("10 mins"),
                                    trailing: Icon(Icons.lock_outline),
                                  ),
                                );
                              },
                            ),
                            // Reviews Tab
                            ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            "https://s3-symbol-logo.tradingview.com/apple--600.png",
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Reviewer Name",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Chip(
                                                    label: Text(
                                                      "⭐ ${4 + index % 2}",
                                                    ),
                                                    backgroundColor:
                                                        Colors.blue.shade50,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "This course is great. I learned a lot!",
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.thumb_up,
                                                    size: 16,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text("${300 + index * 50}"),
                                                  SizedBox(width: 12),
                                                  Text(
                                                    "2 weeks ago",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {},
                          child: Text("Enroll Course - \$40"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is CoursesByDetailsError) {
            return Center(child: Text(state.message));
          } else {
            return Text(state.toString());
          }
        },
      ),
    );
  }
}
