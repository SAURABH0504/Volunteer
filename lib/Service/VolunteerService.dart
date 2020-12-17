import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/Model/Volunteer.dart';

class VolunteerService{
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveVolunteer(Volunteer volunteer) {
    _db.collection('Volunteer').doc().set(
        volunteer.toMap());
  }

  Future<List<Volunteer>> getAllVolunteer() async{
    var snapshot=await _db.collection('Volunteer').get();
    List<Volunteer> list=[];
    snapshot.docs.forEach((element){
      list.add(Volunteer.fromFirestore(element.data()));
    });
    return list;
  }

}