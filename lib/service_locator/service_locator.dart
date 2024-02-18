import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final services = GetIt.instance;

Future<void> initializeServices() async {
  //* Firebase Services.
  services.registerLazySingleton(() => FirebaseAuth.instance);
  services.registerLazySingleton(() => FirebaseFirestore.instance);
  services.registerLazySingleton(() => FirebaseStorage.instance);

  services.registerLazySingleton(() => Logger());
}
