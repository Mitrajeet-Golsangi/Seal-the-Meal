import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth.instance;

  auth.signInWithEmailAndPassword(
      email: "mitrajeetgolsangi@gmail.com", password: "mitgol27");

  print(auth.currentUser);
}
