import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
const BusinessCard({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.black,
body: SafeArea(
child: Padding(
padding: const EdgeInsets.all(20),
child: Column(
children: [
const SizedBox(height: 20),

const CircleAvatar(
radius: 60,
backgroundImage: AssetImage("assets/profile.jpg"),
),

const SizedBox(height: 15),
  const Text(
    "Ahmed Mohamed",
    style: TextStyle(
      color: Colors.white,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
  ),

  const SizedBox(height: 5),

  const Text(
    "Flutter Developer",
    style: TextStyle(
      color: Colors.amber,
      fontSize: 20,
    ),
  ),

  const SizedBox(height: 30),

  Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Row(
      children: [
        Icon(Icons.phone, color: Colors.amber, size: 35),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "+20 100 123 4567",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              "Mobile",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  ),

  Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Row(
      children: [
        Icon(Icons.email, color: Colors.amber, size: 35),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ahmed@email.com",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              "Email",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  ),

  Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Row(
      children: [
        Icon(Icons.location_on,
            color: Colors.amber, size: 35),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alexandria, Egypt",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              "Location",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  ),

  const Spacer(),

  const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.code, color: Colors.amber, size: 35),
      Icon(Icons.work, color: Colors.amber, size: 35),
      Icon(Icons.language, color: Colors.amber, size: 35),
    ],
  ),
],
),
),
),
);
}
}

