import 'package:flutter/material.dart';
import 'package:u_commerce_prototype/theming_and_state_managment/app/theme.dart';

class DeliveryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;
  const DeliveryButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.padding = const EdgeInsets.all(14.0)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
              //shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: deliveryGradient,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft)),
          //height: 20,
          child: Padding(
            padding: padding,
            child: Text(
              text,
              style: TextStyle(color: DeliveryColors.white),
              textAlign: TextAlign.center,
            ),
          )),
      onTap: onTap,
    );
  }
}
