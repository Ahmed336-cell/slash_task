import 'package:flutter/material.dart';
class AnnounceImage extends StatefulWidget {
  const AnnounceImage({super.key, required this.heightPercent});
  final double heightPercent;

  @override
  State<AnnounceImage> createState() => _AnnounceImageState();
}

class _AnnounceImageState extends State<AnnounceImage> {
  final PageController _pageController = PageController();
  int current_page=0;
  final List<String>_images=[
    'assets/images/black_friday.png',
    'assets/images/sales.jpg'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      int i = _pageController.page!.round();
      if(current_page != i){
        setState(() {
          current_page=i;

        });
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.90,
              height: MediaQuery.of(context).size.height*widget.heightPercent,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details){
                    _pageController.position.moveTo(
                      _pageController.position.pixels-details.delta.dx
                    );
                  },
                  child: PageView.builder
                    (
                    controller: _pageController,
                    itemCount: _images.length,
                      itemBuilder:(context,index){
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image:  DecorationImage(
                              image: AssetImage(_images[index]),
                              fit: BoxFit.cover
                          ),
                        ),
                      );
                      }

                  ),
                ),
              ),

            ),
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_images.length, (index){
            return AnimatedContainer(
                duration: const Duration(microseconds: 300),
              margin:  const EdgeInsets.symmetric(horizontal: 5),
              height: 10,
              width: current_page == index ?20:10,
              decoration: BoxDecoration(
                color: current_page==index ? Colors.black:Colors.grey,
                borderRadius: BorderRadius.circular(5)
              ),
            );
          }),
        )
      ],
    );
  }
}
