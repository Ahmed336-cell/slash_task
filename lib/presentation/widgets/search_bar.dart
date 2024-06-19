import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Container(
        color: Colors.grey.shade300,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search here...',
            prefixIcon: const Icon(Icons.search),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
                style: BorderStyle.none
              )
            ),
          ),
        ),
      ),
    );
  }
}
