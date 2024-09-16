
import 'package:flutter/material.dart';
import 'package:take_sell/utils/constants.dart';

class CommonRatingWidget extends StatelessWidget {
  const CommonRatingWidget({super.key, required this.ratingStar});
  final int ratingStar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ratingStar*17,
          height: 20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: ratingStar,
              itemBuilder: (context,index){
            return  const Icon(Icons.star,color: primaryColor,size: 17,);
          }),
        ),
        SizedBox(
          width: (5-ratingStar)*17,
          height: 20,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5-ratingStar,
              itemBuilder: (context,index){
                return  const Icon(Icons.star,color: Colors.grey,size: 17,);
              }),
        ),
      ],
    );
  }
}
