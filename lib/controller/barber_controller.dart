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
      final response = await http.get(Uri.parse(Constant.baseUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        barber.value = BarberModel.fromJson(data['barber']);
        print(barber.value?.barberServies?.first.categoryIcon);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
