import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF121212),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber, width: 3),
                ),
                child:  CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assests/Screenshot (1).png'),
                ),
              ),

               SizedBox(height: 16),

               Text(
                'Ahmed Mohamed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
               SizedBox(height: 6),
               Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

               SizedBox(
                width: 300,
                child: Divider(
                  color: Colors.white24,
                  height: 30,
                  thickness: 2,
                ),
              ),

               Card(
                color: Color(0xFF1E1E1E),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.amber),
                  title: Text(
                    '+20 100 123 4567',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

               Card(
                color: Color(0xFF1E1E1E),
                child: ListTile(
                  leading: Icon(Icons.email_outlined, color: Colors.amber),
                  title: Text(
                    'ahmed@email.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

               Card(
                color: Color(0xFF1E1E1E),
                child: ListTile(
                  leading: Icon(Icons.location_on_outlined, color: Colors.amber),
                  title: Text(
                    'Alexandria, Egypt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

               SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.amber,
                    child: IconButton(
                      icon: Icon(Icons.code, color: Colors.black, size: 22),
                      onPressed: () {},
                    ),
                  ),
                   SizedBox(width: 16),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.amber,
                    child: IconButton(
                      icon:  Icon(Icons.work, color: Colors.black, size: 22),
                      onPressed: () {},
                    ),
                  ),
                   SizedBox(width: 16),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.amber,
                    child: IconButton(
                      icon:  Icon(Icons.alternate_email, color: Colors.black, size: 22),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

    );
  }
}

