import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';

final userIDProvider = Provider<UniqueId?>(
  (ref) => ref.watch(authStateProvider).userUniqueID,
);