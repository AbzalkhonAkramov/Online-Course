import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  bool isMentorTab = false;

  final List<Map<String, dynamic>> _courses = [
    {
      'title': '3D Modelling & Texturing',
      'price': 25,
      'students': 15827,
      'image': 'https://via.placeholder.com/64'
    },
    {
      'title': '3D Characters Illustration',
      'price': 52,
      'students': 12726,
      'image': 'https://via.placeholder.com/64'
    },
    {
      'title': 'Mastering 3D Modelling',
      'price': 28,
      'students': 9421,
      'image': 'https://via.placeholder.com/64'
    },
  ];

  final List<Map<String, dynamic>> _mentors = [
    {
      'name': 'Benny Williams',
      'position': 'Director of Marketing',
      'image': 'https://randomuser.me/api/portraits/men/32.jpg'
    },
    {
      'name': 'Charlotte Williams',
      'position': 'VP of Marketing',
      'image': 'https://randomuser.me/api/portraits/women/44.jpg'
    },
    {
      'name': 'Jamel Williams',
      'position': 'Senior UX Designer',
      'image': 'https://randomuser.me/api/portraits/men/72.jpg'
    },
  ];

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredCourses = _courses
        .where((course) => course['title'].toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    final filteredMentors = _mentors
        .where((mentor) => mentor['name'].toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    final isEmptyResult =
        (isMentorTab ? filteredMentors : filteredCourses).isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() => searchText = value);
              },
              decoration: InputDecoration(
                hintText: 'Search 3D Design or Mentors',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      !isMentorTab ? Colors.blue : Colors.white,
                      foregroundColor:
                      !isMentorTab ? Colors.white : Colors.blue,
                      side: BorderSide(color: Colors.blue),
                    ),
                    onPressed: () => setState(() => isMentorTab = false),
                    child: Text('Courses'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      isMentorTab ? Colors.blue : Colors.white,
                      foregroundColor:
                      isMentorTab ? Colors.white : Colors.blue,
                      side: BorderSide(color: Colors.blue),
                    ),
                    onPressed: () => setState(() => isMentorTab = true),
                    child: Text('Mentors'),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          Expanded(
            child: isEmptyResult
                ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.sentiment_dissatisfied,
                      size: 80, color: Colors.grey),
                  SizedBox(height: 8),
                  Text('Not Found',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(
                    'Try another keyword.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount:
              isMentorTab ? filteredMentors.length : filteredCourses.length,
              itemBuilder: (_, index) {
                final item = isMentorTab
                    ? filteredMentors[index]
                    : filteredCourses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item['image']),
                      radius: 28,
                    ),
                    title: Text(
                      isMentorTab ? item['name'] : item['title'],
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      isMentorTab
                          ? item['position']
                          : "\$${item['price']} · ${item['students']} students",
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
