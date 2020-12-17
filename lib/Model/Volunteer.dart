class Volunteer{
  String name;
  String email;
  String password;

  Volunteer({this.name,this.email,this.password});
  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'password' : password
    };
  }
  Volunteer.fromFirestore(Map<String,dynamic> firestore)
      : name = firestore['name'],
        email = firestore['email'],
        password = firestore['password'];
}