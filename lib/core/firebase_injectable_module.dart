import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'router/app_router.dart';

@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  FacebookAuth get facebookSignIn => FacebookAuth.instance; 

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @singleton
  AppRouter get appRouter => AppRouter();
}
