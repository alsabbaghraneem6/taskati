import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.blue,
      title: Text("Bmi calc"),
      foregroundColor: Colors.white,
      centerTitle: true,
      ),
      body: Row(
        children: [

           GestureDetector(
             onTap: () {

             },
            child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white, width: 5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.male,size: 90,),
                Text("Male",style: TextStyle(color: Colors.white,fontSize: 40),),
              ],
            ),
                    ),
          ),
          Expanded(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white, width: 5)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.female,size: 90,),
                  Text("Female",style: TextStyle(color: Colors.white,fontSize: 40),),
                ],
              ),
            ),
          ),],
      )



    );
  }
}
