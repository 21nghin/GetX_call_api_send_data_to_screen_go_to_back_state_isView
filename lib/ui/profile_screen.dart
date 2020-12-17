import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ex1/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: controller.goToBackWithData,
          ),
          title: Text('Profile User'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: PhysicalModel(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepPurple[300],
                  shadowColor: Colors.deepOrange,
                  clipBehavior: Clip.hardEdge,
                  child:
                      Image.network(controller.user.avatar, fit: BoxFit.fill),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                controller.user.firstName + controller.user.lastName,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                controller.user.email,
                style: TextStyle(fontSize: 13, color: Colors.black87),
              ),
              const SizedBox(height: 15),
              CupertinoTextField(
                onChanged: controller.onInputTextChange,
              ),
              SizedBox(height: 3),
              CupertinoButton(
                child: Text('Chấp nhận'.toUpperCase()),
                onPressed: controller.goToBackWithData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
