// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i806;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:instagram_clone/core/firebase_injectable_module.dart' as _i874;
import 'package:instagram_clone/core/router/app_router.dart' as _i459;
import 'package:instagram_clone/features/instagram_clone/domain/repository/auth_service.dart'
    as _i803;
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart'
    as _i725;
import 'package:instagram_clone/features/instagram_clone/domain/repository/storage_service.dart'
    as _i888;
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firebase_auth_provider.dart'
    as _i0;
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firebase_storage_provider.dart'
    as _i441;
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart'
    as _i372;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.singleton<_i459.AppRouter>(() => firebaseInjectableModule.appRouter);
    gh.lazySingleton<_i116.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i806.FacebookAuth>(
        () => firebaseInjectableModule.facebookSignIn);
    gh.lazySingleton<_i59.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => firebaseInjectableModule.firestore);
    gh.lazySingleton<_i888.StorageService>(
        () => _i441.FirebaseStorageProvider());
    gh.lazySingleton<_i803.AuthService>(() => _i0.FirebaseAuthProvider());
    gh.lazySingleton<_i725.FirestoreService>(
        () => _i372.FirebaseFirestoreProvider());
    return this;
  }
}

class _$FirebaseInjectableModule extends _i874.FirebaseInjectableModule {}
