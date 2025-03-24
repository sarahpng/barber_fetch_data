import 'package:barber_assignment/model/barber_model.dart';
import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  final List<BarberServies>? servies;
  const ServicesView({super.key, this.servies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: servies?.length,
        itemBuilder: (context, index) {
          return Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(color: Colors.grey),
              child: ListTile(
                title: Text('${servies?[index].categoryName}'),
              ));
        });
  }
}
