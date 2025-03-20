import 'dart:convert';

import 'package:barber_assignment/model/barber_model.dart';
import 'package:barber_assignment/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BarberController extends GetxController {
  final Rx<BarberModel?> barber = Rx<BarberModel?>(null);
  // final RxInt barberSelectedIndex = (0).obs;

  // @override
  // void onInit() {
  //   fetchBarber();
  //   super.onInit();
  // }

  Future<void> fetchBarber() async {
    try {
      print("The url is: ${Constant.baseUrl}/api/v2/user/barbers?barberId=19");

      ///Starting here, base url should just save the base url, (the part of api url that's common for all)
      ///
      final response = await http.get(
          Uri.parse('${Constant.baseUrl}/api/v2/user/barbers?barberId=19'));

      print("The response is: ${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        barber.value = BarberModel.fromJson(data['barber']);
        print(barber.value?.barberServices?.first.categoryIcon);
        print("The barber name is ${barber.value?.name}");
        print(
            "The barber name is ${barber.value?.barberServices?.first.categoryName}");
        print(
            "The barber name is ${barber.value?.barberServices?.first.price}");
      }

      ///Else to know what's wrong
      else {
        print('Failed to fetch barber: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
