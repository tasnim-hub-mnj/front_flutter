import 'package:beyt/controller/Home/Owner/MyApartement_Controller.dart';
import 'package:beyt/view/screen/Home/Owner/Apartments/UpdateAprtment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Apartment {
  MyApartmentControllerImp controller = Get.put(MyApartmentControllerImp());
  String? id, city, area, address, price, space, room, bathroom, apartmentPhoto;
  int? isAvailable,rating;
  Widget? action;
  Apartment({
    this.id,
    this.city,
    this.address,
    this.area,
    this.price,
    this.space,
    this.room,
    this.bathroom,
    this.apartmentPhoto,
    this.rating,
    this.isAvailable,
    this.action,
  });
  Apartment.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    city = json['city'];
    area = json['area'];
    address = json['address'];
    price = json['price'];
    space = json['space'];
    room = json['room'];
    bathroom = json['bath_room'];
    apartmentPhoto = json['image'];
    rating = json['average_rating'];
    isAvailable = json['is_available'];
    action = Row(
      children: [
        MaterialButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'Sure Massage',
              middleText: 'Are you sure you want to reject user?',
              actions: [
                ElevatedButton(
                  onPressed: () {
                    controller.deleteApartment(id.toString());
                    Get.back();
                  },
                  child: Text("Confirm"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("cancel"),
                ),
              ],
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          color: const Color.fromARGB(255, 230, 7, 7),
          textColor: Colors.white,
          child: Text("Delete", style: TextStyle(fontSize: 16)),
        ),
        SizedBox(width: 12),
        MaterialButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'Sure Massage',
              middleText: 'Are you sure you want to accept user?',
              actions: [
                ElevatedButton(
                  onPressed: () {
                    controller.getOneApartments(id.toString());
                    Get.back();

                    Get.to(() => UpdateApartment(Id: "$id"));
                  },
                  child: Text("Confirm"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("cancel"),
                ),
              ],
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          color: Color.fromARGB(255, 254, 94, 36),
          textColor: Colors.white,
          child: Text("Update", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['area'] = this.area;
    data['address'] = this.address;
    data['price'] = this.price;
    data['space'] = this.space;
    data['room'] = this.room;
    data['bath_room'] = this.bathroom;
    data['image'] = this.apartmentPhoto;
    data['average_rating'] = this.rating;
    action = this.action;
    return data;
  }
}
