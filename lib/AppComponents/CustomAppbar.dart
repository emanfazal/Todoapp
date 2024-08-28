import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/assets.dart';

import '../Constants/utils.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Container(

        child: Row(
        children: [
          Image.asset(Assets.imagesListIcon),
          SizedBox(width: 30,),
          Text(AppText.Todolist,style: TextStyles.appbartextheight20,),
          Spacer(),
        IconButton(onPressed: (){}, icon:   Image.asset(Assets.imagesFilterIcon))
        ],
        ),
      ),
    );
  }
}
