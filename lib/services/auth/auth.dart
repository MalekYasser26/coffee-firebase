  import 'package:coffee/models/userModel.dart';
import 'package:coffee/services/databases/database.dart';
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
  Future LoginEmailPass(String email , String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user ;
      return _userFromFirebaseUser(user);
    }
    catch (e){
      print(e.toString());
      return null ;
    }
  }


  // register email  , pass
  Future RegEmailPass(String email , String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user ;

      // create a new document for user with his uid
      await DatabaseService(uid: user!.uid ).updateUserData('0', 100, 'new member');

      return _userFromFirebaseUser(user);
    }
    catch (e){
      print(e.toString());
      return null ;
    }
  }

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