import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventmanagement/Screens/screen-1.dart';
import 'package:flutter/material.dart';

class Silder_Screen extends StatefulWidget {
  const Silder_Screen({super.key});

  @override
  State<Silder_Screen> createState() => _Silder_ScreenState();
}

class _Silder_ScreenState extends State<Silder_Screen> {
  List imageList =[
    {"id":1,"image_path":'assets/images/picture2.jpg'},
    {"id":1,"image_path":'assets/images/picture3.jpg'},
    {"id":1,"image_path":'assets/images/picture2.jpg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Silder'),
        leading: IconButton(onPressed: (){},
            icon: const Icon(Icons.menu)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                InkWell(
                  onTap: (){
                    print(currentindex);
                  },
                  child: CarouselSlider(
                    items: imageList
                        .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                    ),
                    ).toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason){
                        setState(() {
                          currentindex = index;
                        });
                      }
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                    left: 0,
                    right: 0,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry){
                        print(entry);
                        print(entry.key);
                        return GestureDetector(
                          onTap: ()=> carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentindex == entry.key ? 17:7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0 ,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: currentindex == entry.key
                                ? Colors.white: Colors.orange
                            ),
                          ),
                        );
                    }).toList(),
                ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen1()));},
                        child: Container(
                          height:170,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Exam Notice",  textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen1()));},
                        child: Container(
                          height:170,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Department Events",  textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen1()));},
                        child: Container(
                          height:170,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Exam Notice",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen1()));},
                        child: Container(
                          height:170,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Department Events",  textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                  ],
                ),
            ),
        ],
      ),
    );
  }
}
