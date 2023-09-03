import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
late final String uid ;
DatabaseService({ required this.uid});
  // collection reference

  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brewData');
  Future updateUserData(String sugars , int strength , String name) async {
    return await brewCollection.doc(uid).set({
      'sugar':sugars ,
      'name' : name ,
      'strength' : strength ,
    });

  }

}