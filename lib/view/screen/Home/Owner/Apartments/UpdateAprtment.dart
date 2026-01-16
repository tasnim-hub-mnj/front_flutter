import 'package:beyt/controller/Home/Owner/MyApartement_Controller.dart';
import 'package:beyt/core/class/StatusRequest.dart';
import 'package:beyt/core/functions/ValidInput.dart';
import 'package:beyt/data/model/Home/Owner/apartmentData.dart';
import 'package:beyt/linkapi.dart';
import 'package:beyt/view/widget/Home/Owner/DropDownApartment-larg.dart';
import 'package:beyt/view/widget/Home/Owner/DropDownApartment-small.dart';
import 'package:beyt/view/widget/Home/Owner/TextFieldApartment.dart';
import 'package:beyt/view/widget/auth/ButtonAuth.dart';
import 'package:beyt/view/widget/auth/TextFieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UpdateApartment extends StatelessWidget {
  final String Id;
  const UpdateApartment({super.key, required this.Id});

  @override
  Widget build(BuildContext context) {
    MyApartmentControllerImp controller = Get.put(MyApartmentControllerImp());
    StatusRequest.loading;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Update Apartment",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => controller.showOption(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 370,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                      child: Image.network(
                        "${AppLink.image}${Apartment.fromJson(controller.oneApartment[0]).apartmentPhoto!}",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              GetBuilder<MyApartmentControllerImp>(
                builder: (controller) => DropdownApartmentCity(
                  value: Apartment.fromJson(controller.oneApartment[0]).city!,
                  onChanged: (val) {
                    controller.showCity(val!);
                    controller.city.text = val;
                  },
                  hint: 'City',
                ),
              ),
              SizedBox(height: 20),
              GetBuilder<MyApartmentControllerImp>(
                builder: (controller) => DropdownApartmentArea(
                  value: Apartment.fromJson(controller.oneApartment[0]).area!,
                  onChanged: (val) {
                    controller.showArea(val!);
                    controller.area.text = val;
                  },
                  hint: 'Area',
                ),
              ),
              SizedBox(height: 20),
              TextFieldAuth(
                isSucre: false,
                isNumber: false,
                myController: controller.address,
                hintText: Apartment.fromJson(
                  controller.oneApartment[0],
                ).address!,
                label: "Apartment Address",
                icon: Icons.location_on,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<MyApartmentControllerImp>(
                    builder: (controller) => DropdownApartmentSmall(
                      value: Apartment.fromJson(
                        controller.oneApartment[0],
                      ).room!,
                      onChanged: (val) {
                        controller.showRoom(val!);
                        controller.room.text = val;
                      },
                      hint: 'Max',
                    ),
                  ),
                  GetBuilder<MyApartmentControllerImp>(
                    builder: (controller) => DropdownApartmentSmall(
                      value: Apartment.fromJson(
                        controller.oneApartment[0],
                      ).bathroom!,
                      onChanged: (val) {
                        controller.showBathRoom(val!);
                        controller.bathroom.text = val;
                      },
                      hint: 'Max',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldApartment(
                    isSucre: false,
                    isNumber: true,
                    valid: (val) {
                      return validInput(val!, 1, 5, "space");
                    },
                    myController: controller.space,
                    hintText: Apartment.fromJson(
                      controller.oneApartment[0],
                    ).space!,
                    label: "Apartment Space",
                    icon: FaIcon(FontAwesomeIcons.solidHouse, size: 18),
                  ),
                  GetBuilder<MyApartmentControllerImp>(
                    builder: (controller) => TextFieldApartment(
                      isSucre: false,
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 1, 6, "price");
                      },
                      onTapIcon: () {
                        controller.changcoin();
                      },
                      myController: controller.price,
                      hintText: controller.isSP
                          ? Apartment.fromJson(
                              controller.oneApartment[0],
                            ).price!
                          : "Price in S.P",
                      label: "Apartment Price",
                      icon: FaIcon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.dollar,
                        size: 18,
                        color: controller.isSP
                            ? Colors.grey.shade600
                            : Color.fromARGB(255, 14, 200, 1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              SizedBox(height: 15),
              ButtonAuth(
                text: "Update Now",
                onPressed: () {
                  controller.updateApartment(Id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
