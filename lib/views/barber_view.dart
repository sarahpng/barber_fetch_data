import 'package:barber_assignment/controller/barber_controller.dart';
import 'package:barber_assignment/views/services_view.dart';
import 'package:barber_assignment/widgets/circle_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarberView extends StatefulWidget {
  const BarberView({super.key});

  @override
  State<BarberView> createState() => _BarberViewState();
}

class _BarberViewState extends State<BarberView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final BarberController controller = Get.isRegistered()
      ? Get.find<BarberController>()
      : Get.put(BarberController());

  @override
  void initState() {
    controller.fetchBarber();
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

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
                          color: Colors.black.withOpacity(0.4),
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
                    Container(
                      alignment: Alignment.center,
                      child: DefaultTabController(
                        length: 3,
                        child: TabBar(
                            controller: _tabController,
                            // isScrollable: true,
                            indicator: CircleTabIndicator(
                                color: Colors.black, radius: 3),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorWeight: 1.0,
                            // padding:
                            // EdgeInsets.only(top: 10, right: 10, left: 10),
                            labelColor: Color.fromARGB(255, 0, 0, 0),
                            dividerHeight: 0,
                            tabs: [
                              Tab(
                                child: Text('Services'),
                              ),
                              Tab(
                                child: Text('Reviews'),
                              ),
                              Tab(
                                child: Text('Availability'),
                              ),
                            ]),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          ServicesView(
                            servies: controller.barber.value?.barberServices,
                          ),
                          // ListView.builder(
                          //   itemCount: controller
                          //           .barber.value?.barberServices?.length ??
                          //       0,
                          //   itemBuilder: (context, index) => Container(
                          //     child: Text(
                          //         '${controller.barber.value?.barberServices?[index].categoryName}'),
                          //   ),
                          // ),
                          Center(child: Text('Tab 2')),
                          Center(child: Text('Tab 3')),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
