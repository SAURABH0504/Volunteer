import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/Model/NGO.dart';
import 'package:myapp/Model/Volunteer.dart';

class NGOService{
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveNGO(NGO volunteer) {
    _db.collection('NGO').doc().set(
        volunteer.toMap());
  }

  Future<List<NGO>> getAllNGO() async{
    var snapshot=await _db.collection('NGO').get();
    List<NGO> list=[];
    snapshot.docs.forEach((element){
      list.add(NGO.fromFirestore(element.data()));
    });
    print(list.length);
    return list;
  }
}