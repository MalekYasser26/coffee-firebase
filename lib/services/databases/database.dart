import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/brewModel.dart';
class DatabaseService{
 final String ?uid ;
DatabaseService({ this.uid});
  // collection reference

  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brewData');
  Future updateUserData(String sugars , int strength , String name) async {
    return await brewCollection.doc(uid).set({
      'sugar':sugars ,
      'name' : name ,
      'strength' : strength ,
    });

  }
  //  brew list from snapshot
 List <brewModel>?_brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return brewModel(
        name: doc.get('name') ?? "",
        strength: doc.get('strength')??0,
        sugars: doc.get('sugar')??"0",
      );
    }).toList();

 }

  // get brewdata stream
  Stream < List <brewModel>?> get BrewData{
    return brewCollection.snapshots().map((_brewListFromSnapshot));
  }

}