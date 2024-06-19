import 'package:flutter/material.dart';

class HeadOfProductCategory extends StatelessWidget {
  const HeadOfProductCategory({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600,color: Color(0xff292929)),),
        const Row(
          children: [
            Text("See all",style: TextStyle(fontSize: 14 ,color: Color(0xff292929),fontWeight: FontWeight.w500)),
            SizedBox(width: 10,),
            Icon(Icons.arrow_forward_ios_sharp,)
          ],
        ),
      ],
    );
  }
}
