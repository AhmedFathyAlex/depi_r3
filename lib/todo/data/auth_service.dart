// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//  static FirebaseAuth auth = FirebaseAuth.instance;

//   static bool get isLoggedIn {
//     return auth.currentUser != null;
//   } 


//   static UserCredential get getCurrentUser {
//     return auth.currentUser as UserCredential;
//   }


//  static Future<UserCredential>  login({required String email, required String password})async{
//     var user = await auth.signInWithEmailAndPassword(email: email, password: password);
//     print(user);
//     return user;
//   }

//  static Future<UserCredential> signup({required String email , required String password})async{ 
//    var user = await auth.createUserWithEmailAndPassword(email: email, password: password);
//     print(user);
//     return user;
//   }

//   static logout(){
//     auth.signOut();
//   }
// }