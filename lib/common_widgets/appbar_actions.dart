import 'package:flutter/material.dart';
import 'package:take_sell/utils/constants.dart';

class AppbarActions extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  const AppbarActions({
    super.key, required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: primaryWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(-1.0, 1.5), //(x,y)
            blurRadius: 6.0,
          ),
        ]
      ),
      child: IconButton(onPressed: onPressed,icon: icon,iconSize: 25,),
    );
  }
}