import 'dart:async';
import 'package:beyt/bindings/intialbindings.dart';
import 'package:beyt/core/constant/routes.dart';
import 'package:beyt/core/functions/CheckInternet.dart';
import 'package:beyt/core/localization/ChangeLocal.dart';
import 'package:beyt/core/localization/translation.dart';
import 'package:beyt/core/services/services.dart';
import 'package:beyt/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Splash(),
      getPages: routes,
      initialBinding: InitialBindings(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var res;

  intialdata() async {
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.language);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 0),
              child: Image.asset("assets/images/logo.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              child: Text(
                "B e y t",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 236, 107, 71),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
