import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'profile_screen_card.dart';

class ProfileScreen extends StatefulWidget {
  final List<Color> color;
  final String name;
  final String dob;
  final String gender, ai;
  final String date;
  const ProfileScreen({
    Key? key,
    required this.color,
    required this.name,
    required this.dob,
    required this.gender,
    required this.ai,
    required this.date,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: [
          const SizedBox(width: 200),
          CardFlip(
            color: widget.color,
            name: widget.name,
            dob: widget.dob,
            gender: widget.gender,
            ai: widget.ai,
            date: widget.date,
            msg: 'Achievements',
            ttl: 'Cover Agent',
            logoutmsg: const ["  Signing Off", "Take Break"],
            col: Colors.purple,
            k: 0,
          ),
          const Icon(
            FlutterIcons.link_2_fea,
            size: 50,
          ),
          CardFlip(
            color: widget.color,
            name: widget.name,
            dob: widget.dob,
            gender: widget.gender,
            ai: widget.ai,
            date: widget.date,
            msg: 'Message from AI',
            ttl: 'Agent AI',
            logoutmsg: const ["Assign new alias?", "Change Alias"],
            col: Colors.pink,
            k: 1,
          ),
        ],
      ),
    ));
  }
}
