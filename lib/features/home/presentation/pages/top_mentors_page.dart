import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Mentors/mentors_bloc.dart';

class TopMentorsPage extends StatefulWidget {

  TopMentorsPage({super.key});

  @override
  State<TopMentorsPage> createState() => _TopMentorsPageState();
}

class _TopMentorsPageState extends State<TopMentorsPage> {
  final List<Mentor> mentors = [
    Mentor(
      "Jacob Kulikowski",
      "Marketing Analyst",
      "https://i.pravatar.cc/100?img=1",
    ),
    Mentor("Claire Ordonez", "VP of Sales", "https://i.pravatar.cc/100?img=2"),
    Mentor(
      "Priscilla Ehrman",
      "UX Designer",
      "https://i.pravatar.cc/100?img=3",
    ),
    Mentor(
      "Wade Chenail",
      "Manager, Solution Engineering",
      "https://i.pravatar.cc/100?img=4",
    ),
    Mentor(
      "Kathryn Pera",
      "Product Manager",
      "https://i.pravatar.cc/100?img=5",
    ),
    Mentor(
      "Francene Vandyne",
      "EVP and GM, Sales Cloud",
      "https://i.pravatar.cc/100?img=6",
    ),
    Mentor(
      "Benny Spanbauer",
      "Senior Product Manager",
      "https://i.pravatar.cc/100?img=7",
    ),
    Mentor(
      "Jamel Eusebio",
      "Product Designer",
      "https://i.pravatar.cc/100?img=8",
    ),
    Mentor(
      "Cyndy Lillibridge",
      "VP of Marketing",
      "https://i.pravatar.cc/100?img=9",
    ),
    Mentor(
      "Titus Kitamura",
      "Technical Lead",
      "https://i.pravatar.cc/100?img=10",
    ),
  ];

  getmentor() {
    context.read<MentorsBloc>().add(MentorsEvent());
}
@override
  void initState() {
    getmentor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Top Mentors',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<MentorsBloc, MentorsState>(
        builder: (context, state) {
          if (state is MentorsLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MentorsLoaded){
          return ListView.builder(
            itemCount: state.response.results.length,
            itemBuilder: (context, index) {
              final mentor = state.response.results[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(mentor.avatarUrl),
                  radius: 25,
                ),
                title: Text(
                  mentor.fullName,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(mentor.bio),
                trailing: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.blueAccent,
                ),
              );
            },
          );
          }
          else if (state is MentorsError){
            return Text(state.message);
          }
          else{
            return Text(state.toString());
          }
        },
      ),
    );
  }
}

class Mentor {
  final String name;
  final String position;
  final String imageUrl;

  Mentor(this.name, this.position, this.imageUrl);
}
