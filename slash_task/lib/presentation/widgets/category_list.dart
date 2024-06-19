import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/presentation/widgets/head_products.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = ["Fashion", "Games", "Accessories", "Books","Artifacts","Pets Care"];
    final icons = ['assets/images/tshirt.png',
      'assets/images/die.png',
      'assets/images/glasses.png',
      'assets/images/books.png',
      'assets/images/paint.png',
      'assets/images/dogcat.png'
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadOfProductCategory(title: "Categories"),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: Image.asset(
                              icons[index],
                              width: 30,
                              height: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(categories[index])
                      ],
                    )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
