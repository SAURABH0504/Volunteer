import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      height: 300,
      width: 600,
      child: Column(
        children: [
          Text('ContactUs',style: TextStyle(color: Colors.black,fontSize: 30),),
          TextField(
            decoration: InputDecoration(
              hintText: 'Your Email'
            ),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Type your Query'
            ),
          ),
        ],
      ),
    ));
  }
}
