import 'package:flutter/material.dart';
import 'package:myapp/Model/NGO.dart';
import 'package:myapp/Service/NGOservice.dart';

class NGOScreen extends StatefulWidget {
  @override
  _NGOScreenState createState() => _NGOScreenState();
}

class _NGOScreenState extends State<NGOScreen> {
  String name;
  String description;
  String location;
  String imageUrl;
  String contactNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }
  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }
        return null;
      },
      onSaved: (String value) {
        description = value;
      },
    );
  }
  Widget _buildLocation() {
    return
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Location'),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Location is Required';
            }

            return null;
          },
          onSaved: (String value) {
            location = value;
          },
        );
  }

  Widget _builImageURL(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (String value) {
        imageUrl = value;
      },
    );
  }

  Widget _buildConatctNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        contactNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Text('Register your Organization',style: TextStyle(color: Colors.black,fontSize: 30),),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildName(),
                        _buildDescription(),
                        _buildLocation(),
                        _builImageURL(),
                        _buildConatctNumber(),
                        SizedBox(height: 20),
                        RaisedButton(
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          onPressed: () {
                            print(name);
                            var service = NGOService();
                            service.saveNGO(NGO(name: name,description: description,location: location,imageUrl: imageUrl));
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            else
                            {}
                            _formKey.currentState.save();
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
