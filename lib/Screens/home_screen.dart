import 'second_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = false;
  bool isFemale = true;
  double height = 100;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0e22),
      appBar: AppBar(
        backgroundColor:  Color(0xff0a0e22),
        title:  Text("Bmi Calculator"),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = !isMale;
                          isFemale = false;
                        });
                      },
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: (isMale ? Colors.blue : Colors.white),
                            width: 5,
                          ),
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male, size: 80, color: Colors.white),
                            Text(
                              "Male",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                   SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFemale = !isFemale;
                          isMale = false;
                        });
                      },
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: isFemale ? Colors.blue : Colors.white,
                            width: 5,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female, size: 80, color: Colors.white),
                            Text(
                              "Female",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

               SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding:  EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                     Text(
                      "Height",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),

                       Row(
                         mainAxisAlignment: .center,
                        children:[
                          Text(
                            height.toInt().toString(),
                            style:  TextStyle(color: Colors.white, fontSize: 45),
                          ),
                          Text("cm",style: TextStyle(fontSize: 10,color: Colors.white,),),
                        ]
                      ),

                    Slider(
                      value: height,
                      min: 80,
                      max: 200,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

               SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            "WEIGHT",
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "$weight",
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton.small(
                                backgroundColor: Colors.white,
                                shape:CircleBorder(eccentricity: CircularProgressIndicator.strokeAlignCenter),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) weight--;
                                  });
                                },
                                child:Icon(Icons.remove, color: Colors.blueGrey),
                              ),
                               SizedBox(width: 12),
                              FloatingActionButton.small(
                                backgroundColor: Colors.white,
                                shape:CircleBorder(eccentricity: CircularProgressIndicator.strokeAlignCenter),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(Icons.add, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                   SizedBox(width: 20),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            "AGE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                           SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton.small(
                                backgroundColor: Colors.white,
                                shape:CircleBorder(eccentricity: CircularProgressIndicator.strokeAlignCenter),
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) age--;
                                  });
                                },
                                child:Icon(Icons.remove, color: Colors.blueGrey),
                              ),
                               SizedBox(width: 12),
                              FloatingActionButton.small(
                                backgroundColor: Colors.white,
                                shape:CircleBorder(eccentricity: CircularProgressIndicator.strokeAlignCenter),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(Icons.add, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SecondScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 60),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

