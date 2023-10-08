import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/auth/sign_in_page.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/comment/post_comment_page.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/create_new_post/create_new_post_page.dart';

import 'package:instagram_clone/features/instagram_clone/presentation/pages/home_page.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/post_details_page.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/tabs/user_info_page.dart';

import 'package:instagram_clone/main.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: MainRoute.page, path: '/'),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: CreateNewPostRoute.page),
    AutoRoute(page: UserInfoRoute.page),
    AutoRoute(page: PostCommentRoute.page),
    AutoRoute(page: PostDetailsRoute.page),
    
  ];
}
