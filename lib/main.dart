import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  PageController controller;
  SwiperController controller2;
var width=[];
var colors=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new PageController();
    controller2 = new SwiperController();
  for(int i=0;i<5;i++)
      {width.add(200.0);
      if(i==0)
        colors.add(Colors.transparent);
      else
      colors.add(Colors.white.withAlpha(1000));}
  }

  @override
  Widget build(BuildContext context) {
    print(width.length);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        new Expanded(
            flex: 1,
            child: Container(
                height: 50.0,
                child: Swiper(
                  controller: controller2,
                  viewportFraction: .4,
                  scale: .01,
                  loop: false,
                  autoplay: false,
                  scrollDirection: Axis.horizontal,
                  onIndexChanged: (i) {
                    setState(() {
                      print("hello");
                      for(int ind=0;ind<5;ind++) {
                        if(i==ind)
                        {width[ind]=10.0;
                        colors[i]=Colors.transparent;}
                        else
                        {width[ind] = 200.0;
                        colors[ind]=Colors.white.withAlpha(1000);
                        }
                      }
                    });
                    controller.animateToPage(i,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  itemBuilder: (context, i) => new GestureDetector(
                      onTap: () {
                        setState(() {
                          print("hello");
                          for(int ind=0;ind<5;ind++) {
                            if(i==ind)
                              {width[ind]=10.0;
                               colors[i]=Colors.transparent;}
                            else
                            {width[ind] = 200.0;
                            colors[ind]=Colors.white.withAlpha(1000);}
                          }
                        });
                        controller2.move(i, animation: true);
                        controller.animateToPage(i,
                            duration: Duration(milliseconds: 10000),
                            curve: Curves.linear);

                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Stack(
                            fit: StackFit.expand,
                              children:[

                            Image.network(
                              "https://akm-img-a-in.tosshub.com/indiatoday/images/story/201805/Mohanlal_bday.jpeg?HzRB5uJkFPQJvnYaUcYTa9WSwd3Jv9rc"),
                            Positioned(
                              bottom: MediaQuery.of(context).size.height*.125,
                              left: MediaQuery.of(context).size.width*.001,
                              child:Container(
                                width: MediaQuery.of(context).size.width*.35,
                                  child:new Center(child: AnimatedContainer(duration: Duration(milliseconds: 300),height: 5,
                                margin: EdgeInsets.symmetric(horizontal: width[i] ),
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width*.35,),
                            ))),
                                Container(
                                  color: colors[i],
                                )

                         ]))),
                  itemCount: 5,
                ))),
        Expanded(
            flex: 2,
            child: PageView.builder(
                itemCount: 5,
                controller: controller,
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                onPageChanged: (i) {
                  setState(() {
                    print("hello");
                    for(int ind=0;ind<5;ind++) {
                      if(i==ind)
                      {width[ind]=10.0;
                      colors[i]=Colors.transparent;}
                      else
                      {width[ind] = 200.0;
                      colors[ind]=Colors.white.withAlpha(1000);}
                    }
                  });
                  controller2.move(i, animation: true);
                },
                itemBuilder: (context, i) => GridView.builder(
                      shrinkWrap: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0),
                      itemBuilder: (context, i) => new Image.network(
                            "https://www.thenewsminute.com/sites/default/files/styles/news_detail/public/Mohanlal_Facebook.jpg?itok=GnnEZFQd",
                            height: 10.0,
                          ),
                      itemCount: 4,
                    ))),
      ]),
    );
  }
}
