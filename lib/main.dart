import 'package:flutter/material.dart';
import 'package:custom_tab/custom_tab.dart';

void main() {
  var Beverages = ["Tea", "Coffee", "Juices"];
  var Pictures = {
    "Tea": [
      "https://cdn2.stylecraze.com/wp-content/uploads/2013/02/20-Benefits-Of-Green-Tea-That-You-Should-Definitely-Know-1.jpg",
      "https://www.drkarafitzgerald.com/wp-content/uploads/2016/02/spicytea-e1455826441744.jpg",
      "https://cdn.cpnscdn.com/static.coupons.com/ext/kitchme/images/recipes/600x400/arnold-palmer-lemonade-iced-tea_44551.jpg",
      "https://d27pcll2dx97vv.cloudfront.net/info/wp-content/uploads/2018/07/Ginger-Black-Tea-1pc.jpg"
    ],
    "Coffee": [
      "https://www.caffesociety.co.uk/assets/recipe-images/latte-small.jpg",
      "https://www.merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/cappuccino-2029-e80b7c6d318c7862df2c4c8623a11f99@1x.jpg",
      "https://assets.mystarbucks.com.au/imagecache/bestfit/620x634/_files/Beverages/caffe_mocha.jpg",
      "http://eugeniekitchen.com/wp-content/uploads/2014/05/OREO-AFFOGATO-F1.jpg"
    ],
    "Juices": [
      "https://cdn2.stylecraze.com/wp-content/uploads/2013/07/10-Best-Benefits-Of-Mango-Juice.jpg",
      "http://kababjiarabia.com/wp-content/uploads/2017/01/freshpineapplejuice.jpg",
      "https://cdn.shopify.com/s/files/1/0940/8252/articles/shutterstock_657913225_grande.jpg?v=1528502395",
      "https://www.organicfacts.net/wp-content/uploads/applejuice-2.jpg"
    ]
  };

  runApp(MaterialApp(
      home: CustomTab(
    3,
    (i) => new ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: new Stack(fit: StackFit.expand, children: [
            Image.network(
              Pictures[Beverages[i]][0],
              fit: BoxFit.fill,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: new Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    Beverages[i],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        background: Paint()
                          ..color = Colors.black.withAlpha(900000),
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ]),
        ),
    (context, i) => new GridView.builder(
        padding: EdgeInsets.all(5.0),
        itemCount: Pictures["Tea"].length,
        shrinkWrap: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, j) => new ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: new Image.network(
                Pictures[Beverages[i]][j],
                fit: BoxFit.fill,
                height: 10.0,
              ),
            )),
    indicatorColor: Colors.yellow,
  )));
}
