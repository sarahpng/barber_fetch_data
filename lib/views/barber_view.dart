import 'package:barber_assignment/controller/barber_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarberView extends StatefulWidget {
  const BarberView({super.key});

  @override
  State<BarberView> createState() => _BarberViewState();
}

class _BarberViewState extends State<BarberView> {
  final BarberController controller = Get.isRegistered()
      ? Get.find<BarberController>()
      : Get.put(BarberController());

  @override
  void initState() {
    controller.fetchBarber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return controller.barber.value == null
              ? CircularProgressIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  controller.barber.value!.profilePic),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          color: Colors.black.withValues(alpha: 0.4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller.barber.value!.name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      controller.barber.value!.averageRating
                                          .toStringAsPrecision(2),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      controller.barber.value!.address,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
