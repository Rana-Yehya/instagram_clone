// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateNewPostRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNewPostRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateNewPostPage(
          key: args.key,
          fileName: args.fileName,
          imageOrVideo: args.imageOrVideo,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserInfoPage(),
      );
    },
  };
}

/// generated route for
/// [CreateNewPostPage]
class CreateNewPostRoute extends PageRouteInfo<CreateNewPostRouteArgs> {
  CreateNewPostRoute({
    Key? key,
    required File fileName,
    required ImageOrVideo imageOrVideo,
    List<PageRouteInfo>? children,
  }) : super(
          CreateNewPostRoute.name,
          args: CreateNewPostRouteArgs(
            key: key,
            fileName: fileName,
            imageOrVideo: imageOrVideo,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateNewPostRoute';

  static const PageInfo<CreateNewPostRouteArgs> page =
      PageInfo<CreateNewPostRouteArgs>(name);
}

class CreateNewPostRouteArgs {
  const CreateNewPostRouteArgs({
    this.key,
    required this.fileName,
    required this.imageOrVideo,
  });

  final Key? key;

  final File fileName;

  final ImageOrVideo imageOrVideo;

  @override
  String toString() {
    return 'CreateNewPostRouteArgs{key: $key, fileName: $fileName, imageOrVideo: $imageOrVideo}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserInfoPage]
class UserInfoRoute extends PageRouteInfo<void> {
  const UserInfoRoute({List<PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
