import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VolunteerScreen extends StatefulWidget {
  @override
  _VolunteerScreenState createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {

  String _name;
  String _email;
  String _password1;
  String _password2;
  String _checkPassword;
  String _url;

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
        _name = value;
      },
    );
  }
  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }
        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }
  Widget _buildPassword() {
    return Column(
      children: [
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is Required';
            }

            return null;
          },
          onSaved: (String value) {
            _password2 = value;
          },
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Confirm Password'),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is Required';
            }

            return null;
          },
          onSaved: (String value) {
            _password1 = value;
          },
        ),
      ],
    );
  }

  Widget _getPassword() {
    return Column(
      children: [
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is Required';
            }
            return null;
          },
          onSaved: (String value) {
            _checkPassword = value;
          },
        ),
      ],
    );
  }

  Widget _builURL() {
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
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
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
        _url = value;
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
                   Text('Sign Up as a Volunteer',style: TextStyle(color: Colors.black,fontSize: 30),),
                   Form(
                     key: _formKey,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         _buildName(),
                         _buildEmail(),
                         _buildPassword(),
                         _buildPhoneNumber(),
                         SizedBox(height: 20),
                         RaisedButton(
                           child: Text(
                             'Sign Up',
                             style: TextStyle(color: Colors.blue, fontSize: 16),
                           ),
                           onPressed: () {
                             if (!_formKey.currentState.validate()) {
                               return;
                             }
                             else
                               {
                                 if(_password1!=_password2)
                                 {
                                   setState(() {
                                     _password2==null;
                                   });
                                 }
                               }
                             _formKey.currentState.save();
                             print(_name);
                             print(_email);
                             print(_url);
                             print(_password1);
                             //Send to API
                           },
                         ),
                       ],
                     ),
                   ),
                   Center(child: Text('Or',style: TextStyle(color: Colors.grey,fontSize: 30))),
                   SizedBox(height: 20),
                   Text('Login Here',style: TextStyle(color: Colors.grey,fontSize: 30)),
                   Form(
                     key: _formKey2,
                     child: Column(
                       children: [_buildEmail(),
                         _getPassword(),
                         RaisedButton(
                           child: Text(
                             'Login',
                             style: TextStyle(color: Colors.blue, fontSize: 16),
                           ),
                           onPressed: () {
                             if (!_formKey2.currentState.validate()) {
                               return;
                             }
                             _formKey.currentState.save();
                             print(_name);
                             print(_email);
                             print(_password1);
                             //Send to API
                           },
                         ),],
                     ),
                   )
                 ],
               ),
             ),
           ],
        ),
      ),
    );
  }
}

