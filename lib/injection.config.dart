// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:instagram_clone/core/firebase_injectable_module.dart' as _i14;
import 'package:instagram_clone/core/router/app_router.dart' as _i3;
import 'package:instagram_clone/features/instagram_clone/domain/repository/auth_service.dart'
    as _i4;
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart'
    as _i9;
import 'package:instagram_clone/features/instagram_clone/domain/repository/storage_service.dart'
    as _i12;
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firebase_auth_provider.dart'
    as _i5;
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firebase_storage_provider.dart'
    as _i13;
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart'
    as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.singleton<_i3.AppRouter>(firebaseInjectableModule.appRouter);
    gh.lazySingleton<_i4.AuthService>(() => _i5.FirebaseAuthProvider());
    gh.lazySingleton<_i6.FacebookAuth>(
        () => firebaseInjectableModule.facebookSignIn);
    gh.lazySingleton<_i7.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i8.FirebaseFirestore>(
        () => firebaseInjectableModule.firestore);
    gh.lazySingleton<_i9.FirestoreService>(
        () => _i10.FirebaseFirestoreProvider());
    gh.lazySingleton<_i11.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i12.StorageService>(() => _i13.FirebaseStorageProvider());
    return this;
  }
}

class _$FirebaseInjectableModule extends _i14.FirebaseInjectableModule {}
