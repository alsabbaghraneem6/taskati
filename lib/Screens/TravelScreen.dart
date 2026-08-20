import 'package:flutter/material.dart';
class Travelscreen extends StatefulWidget {
  const Travelscreen({super.key});

  @override
  State<Travelscreen> createState() => _TravelscreenState();
}

class _TravelscreenState extends State<Travelscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: .center,
          spacing: 15,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xff1c3166),
              ),
              child: Column(children: [
                Text("Where do you want to travel?",style: TextStyle(color: Colors.white,fontSize:45,fontWeight: FontWeight.bold),),
                SizedBox( height: 40,),

                Row(children: [
                   SizedBox(width: 250),

                  FloatingActionButton.small(onPressed: () {},backgroundColor: Colors.white,shape: CircleBorder(eccentricity: CircularProgressIndicator.strokeAlignCenter),child:Icon(Icons.grid_view_rounded, color: Colors.blue),),

                   SizedBox(width: 100,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white,
                      shape:StadiumBorder(), padding:EdgeInsets.symmetric(vertical: 24,horizontal: 60),), onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Select Destination", style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.keyboard_arrow_down),],
                    ),
                  ),

                  SizedBox(width: 100,),
                  FloatingActionButton.small(onPressed: () {},backgroundColor: Colors.white,shape: CircleBorder(eccentricity: CircularProgressIndicator.strokeAlignCenter),child:Icon(Icons.search, color: Colors.blue),),

                ],)
              ],),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
               // mainAxisAlignment: .start,
              children: [
                Align(alignment: Alignment.centerLeft,
              child: Text("Best Deals",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),),
                SizedBox( height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.grey[500], shape:StadiumBorder(), padding:EdgeInsets.symmetric(vertical:25,horizontal: 20),), onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Sorted by lower price", style: TextStyle(color: Colors.grey[500], fontSize: 15, fontWeight: FontWeight.w400,)),
                      Icon(Icons.keyboard_arrow_down),],
                  ),
                ),
              ],)
            ),

          Row(
            children: [
            SizedBox(width: 15,),
            Container(height: 250,width: 250,padding: EdgeInsets.all(40),
              decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(20),),
            child: Column(children: [
              Row(children: [Text("EI CAIRO",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),SizedBox(width:60),Icon(Icons.star,color: Colors.amber,),Text("4.3",style: TextStyle(color: Colors.amber),)],),
              Align(alignment: Alignment.centerLeft,
                child: Text("Egypt",style: TextStyle(color: Colors.black),),),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=600&q=80',
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: StadiumBorder(), padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      minimumSize: Size.zero,),
                    child:Text(
                      "More", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                  ),



                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: StadiumBorder(), padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      minimumSize: Size.zero,),
                    child:Text(
                      "\$200", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                  ),
                ],)
              ],),
            ),
              SizedBox(width: 75,),
              Container(height: 250,width: 250,padding: EdgeInsets.all(40),
                decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(20),),
                child: Column(children: [
                  Row(children: [Text("LONDON",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),SizedBox(width:60),Icon(Icons.star,color: Colors.amber,),Text("4.6",style: TextStyle(color: Colors.amber),)],),
                  Align(alignment: Alignment.centerLeft,
                    child: Text("England",style: TextStyle(color: Colors.black),),),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80',
                      height: 80,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          shape: StadiumBorder(), padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          minimumSize: Size.zero,),
                        child:Text(
                          "More", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                      ),



                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: StadiumBorder(), padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          minimumSize: Size.zero,),
                        child:Text(
                          "\$330", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                      ),
                    ],)
                ],),
              ),
          ],),
          ],),
      ),

    );
  }
}
