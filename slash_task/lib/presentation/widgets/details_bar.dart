import 'package:flutter/material.dart';
class DetailsBar extends StatelessWidget {
  const DetailsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,
      vertical: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Slash." ,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.location_on_rounded , color: Colors.black, ),
              SizedBox(width: 5,),
              Column(
                children: [
                  Text("Nasr City" ,style: TextStyle(fontSize: 14), ),
                  Text("Cairo" , style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_outlined , size: 30,))
        ],
      ),
    );
  }
}
