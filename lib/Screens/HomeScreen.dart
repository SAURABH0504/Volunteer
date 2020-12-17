import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> list=[
    Card(child: Image(image: AssetImage('Images/1.jpg'),),),
    Card(child: Image(image: AssetImage('Images/2.jpg'),),),
    Card(child: Image(image: AssetImage('Images/3.jpg'),),),
    Card(child: Image(image: AssetImage('Images/4.jpg'),),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
            children: [
              Column(
                children: [
                  CarouselSlider(
                    items: list,
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(
                        seconds: 3,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(child: Text('Who we are',style: TextStyle(color: Colors.black,fontSize: 50),)),
                  Container(
                    width: 800,
                      height: 400,
                        child: Center(
                          child: Text("Volunteer stage is a platform that unites all"
                              " growing NGOs that have aim to make a better life for "
                              "all the unprivileged out there. It can be any individual,"
                              "group,animals,environment etc. We Unite them with everyone who "
                              "wants to serve with this organisation to the people.",style: TextStyle(color: Colors.blue,fontSize: 30,fontStyle: FontStyle.italic),),
                        ),
                      ),
                ],
              )
            ]
        ),
      ),
    );
  }
}
