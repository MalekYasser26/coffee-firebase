import 'package:coffee/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthService{

  final FirebaseAuth _auth =  FirebaseAuth.instance ;

  // auth change user stream
  Stream<userModel?> get user {
  return _auth.authStateChanges().map(_userFromFirebaseUser);
  }


  //sign in anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user ;
      return _userFromFirebaseUser(user!) ;
    } catch (e){
      print(e.toString());
      return null ;
    }
  }

  // create user obj

userModel? _userFromFirebaseUser(User? user){
    return user!=null ? userModel(uid : user.uid) : null ;
}



  // sign in email , pass


  // register email , pass


  // sign out
  Future signOut()async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null ;
    }
  }
}