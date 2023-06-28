import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onTap,
    required this.title
  });

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child:  Container(
          decoration:  BoxDecoration(
              color: Colors.black,
              borderRadius:  BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
          child:  Center(child: Text(title,style:const  TextStyle(color: Colors.white),)),
        ));
  }
}
