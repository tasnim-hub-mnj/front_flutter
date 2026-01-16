import 'package:beyt/core/class/StatusRequest.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?   Center(child: Text("Loading..."))
         // ? Center(child: Lottie.asset('assets/lottie/loading.json' , width: 250 , height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Text("Offline"))
            : statusRequest == StatusRequest.serverfailure
                ?Center(child: Text("Server Failure"))
                : statusRequest == StatusRequest.failure
                    ? Center(child: Text("No Data"))
                    : widget;
  }
}