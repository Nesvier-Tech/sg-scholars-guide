
// import 'package:scholars_guide/service_locator/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future fetchQuestions(String subject) {
  return FirebaseFirestore.instance.collection(subject).get();
}



// FirebaseFirestore.instance.collection('math-questions')
//   .doc(blank means random generate)
//     .get()
//     .set( some json data)
//   .snapshots() returns 


// json example = {
//   "question": "What is 2 + 2?",
//   "options": ["1", "2", "3", "4"],
//   "answer": "4"
// }