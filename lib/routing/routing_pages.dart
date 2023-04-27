import 'package:get/get.dart';
import 'package:reqres/pages/add_user/adduser_binding.dart';
import 'package:reqres/pages/add_user/adduser_page.dart';
import 'package:reqres/pages/edit_user/edituser_binding.dart';
import 'package:reqres/pages/edit_user/edituser_page.dart';
import 'package:reqres/pages/home/home_binding.dart';
import 'package:reqres/pages/home/home_page.dart';
import 'package:reqres/pages/regis/regis_page.dart';
import 'package:reqres/pages/single_user/singleuser_binding.dart';
import 'package:reqres/pages/single_user/singleuser_page.dart';
import 'package:reqres/pages/splash_screen/splash_page.dart';
import 'package:reqres/routing/routing_names.dart';

import '../pages/login/login_binding.dart';
import '../pages/login/login_page.dart';
import '../pages/regis/regis_binding.dart';
import '../pages/splash_screen/splash_binding.dart';

class RoutingPages{
  static final pages =[
    GetPage(
        name: Routes.INITIAL,
        page: ()=> const SplashPage(),
        binding: SplashBinding()
    ),
    GetPage(
        name: Routes.login,
        page: ()=> const LoginPage(),
        binding: LoginBinding()
    ),
    GetPage(
        name: Routes.register,
        page: ()=> const RegisPage(),
        binding: RegisBinding()
    ),
    GetPage(
        name: Routes.home,
        page: ()=> const HomePage(),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.single_user,
        page: ()=> const SingleUserPage(),
        binding: SingleUserBinding()
    ),
    GetPage(
        name: Routes.add_user,
        page: ()=> const AddUserPage(),
        binding: AddUserBinding()
    ),
    GetPage(
        name: Routes.edit_user,
        page: ()=> const EditUserPage(),
        binding: EditUserBinding()
    ),
  ];
}