import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/middleware/myMiddelware.dart';
import 'package:beyt/view/screen/Home/Owner/Apartments/AddApartment.dart';
import 'package:beyt/view/screen/Home/Owner/Apartments/SettingApartment.dart';
import 'package:beyt/view/screen/Home/Owner/MyApartments.dart';
import 'package:beyt/view/screen/Home/Owner/profile/OwnerProfile.dart';
import 'package:beyt/view/screen/Home/Owner/profile/UpdateProfile.dart';
import 'package:beyt/view/screen/Home/Renter/Favorite.dart';
import 'package:beyt/view/screen/Home/Renter/RenterProfile.dart';
import 'package:beyt/view/screen/Home/Renter/Search.dart';
import 'package:beyt/view/screen/Home/notification.dart';
import 'package:beyt/view/screen/HomePage.dart';
import 'package:beyt/view/screen/OnBoarding.dart';
import 'package:beyt/view/screen/auth/ForgetPassword/ForgetPassword.dart';
import 'package:beyt/view/screen/auth/Login.dart';
import 'package:beyt/view/screen/auth/ForgetPassword/ResetPassword.dart';
import 'package:beyt/view/screen/auth/Signup.dart';
import 'package:beyt/view/screen/auth/ForgetPassword/Success.dart';
import 'package:beyt/view/screen/auth/ForgetPassword/VerifyCode.dart';
import 'package:beyt/view/screen/auth/Success_Signup.dart';
import 'package:beyt/view/screen/auth/VerifyCodeSignup.dart';
import 'package:beyt/view/screen/language.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const Signup()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const Forgetpassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.success, page: () => const Success()),
  GetPage(name: AppRoutes.successSignup, page: () => const SuccessSignup()),

  GetPage(
    name: AppRoutes.verifyCodeSignup,
    page: () => const VerifyCodeSignUp(),
  ),
  //OnBoarding
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  GetPage(
    name: AppRoutes.language,
    page: () => const Language(),
    middlewares: [MyMiddleware()],
  ),
  //Home
  GetPage(name: AppRoutes.home, page: () => const HomePage()),
  //Renter
  GetPage(name: AppRoutes.search, page: () => const SearchScreen()),
  GetPage(name: AppRoutes.favorite, page: () => const FavoriteScreen()),
  GetPage(name: AppRoutes.message, page: () => const SearchScreen()),
  GetPage(
    name: AppRoutes.renterProfile,
    page: () => const RenterProfileScreen(),
  ),
  GetPage(name: AppRoutes.notification, page: () => const SearchScreen()),
  //Owner
  GetPage(name: AppRoutes.myApartments, page: () => const MyApartments()),
  GetPage(name: AppRoutes.ownerProfile, page: () => const OwnerProfileScreen()),
  GetPage(
    name: AppRoutes.ownerProfileUpdate,
    page: () => const UpdateProfile(),
  ),
  GetPage(name: AppRoutes.addApartment, page: () => const AddApartment()),
  GetPage(name: AppRoutes.settingApartment, page: () => const SettingApartments()),
  GetPage(name: AppRoutes.notifications, page: () => const Notification()),
];
