import 'package:retail_app/ModelClass.dart';
import 'package:retail_app/MyAppBar.dart';
import 'package:retail_app/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  //create Instance of this class ExpandableView
  ExpandableView expandableView=new ExpandableView();

  List<String> list=['asset/Achappam.jpg','asset/biriyani.jpg',
    'asset/images.jpg','asset/Kuzhalappam.jpg','.asset/unniyappam.jpg',
    'asset/lemonpickle.jpg','asset/meals.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: new AppBar(
        backgroundColor: Colors.cyan[900],
        title: new Text("Retail  App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.expand_more), onPressed: () {
            expandableView.expandedView.tappedEvent();
          })
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  myList(context),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.asset("asset/ariyunda.jpg",
                                scale: 6.5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.asset("asset/Achappam.jpg",
                                scale: 6.5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                              child: Image.asset("asset/biriyani.jpg",
                                scale: 6.5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.asset("asset/images.jpg",
                                scale: 6.5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.asset("asset/Kuzhalappam.jpg",
                                scale: 6.5,
                              ),
                            )

                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Container(
                            height: 200,
                            child: Swiper(
                              itemCount: 5,
                              viewportFraction: 0.4,
                              scale: 0.5,
                              itemBuilder: (BuildContext context,int index){
                                if(index==0){
                                  return Image1("asset/Achappam.jpg");
                                }
                                else if(index==1){
                                  return Image1("asset/biriyani.jpg");
                                }
                                else if(index==2){
                                  return Image1("asset/images.jpg");
                                }else if(index==3){
                                  return Image1("asset/Kuzhalappam.jpg");
                                }
                                else{
                                  return Image1("asset/unniyappam.jpg");
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  List1(),
                  SizedBox(
                      height:10
                  ),
                  Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context,index){
                          return Container(
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      list[index],
                                      scale: 2.5,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Kuzhalappam",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,

                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Home Delivery available on Request",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: (){
                                      ModelProject model=new ModelProject(
                                          "Achappom","Home delivery available on Request",
                                          list[index]
                                      );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context)=>Second(),
                                              settings: RouteSettings(
                                                arguments: model,
                                              )
                                          )
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                  )

                ],
              )
          ),
          new Column(
            children: <Widget>[expandableView],
          )
        ],
      ),
    );
  }

  Widget myList(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: <Widget>[
            CardDesign("Kuzhalappam"),
            CardDesign("Achappam"),
            CardDesign("Biriyani"),
            CardDesign("Pickle"),
            CardDesign("Meals"),
            CardDesign("Ladoo"),
            CardDesign("Mixture"),
            CardDesign("Unniyappam"),
            CardDesign("Cake")
          ],
        ),
      ),
    );
  }
  Widget CardDesign(String text){
    return Card(
      color: Colors.cyan[700],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
  Widget Image1(dynamic image){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          )
      ),
    );
  }

  Widget List1(){
    Color color=Colors.cyan[900];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: <Widget>[
            CardDesign1("Kuzhalappam",Icon(Icons.emoji_food_beverage,color: color,)),
            CardDesign1("Achappam",Icon(Icons.emoji_food_beverage,color: color,)),
            CardDesign1("Biriyani",Icon(Icons.emoji_food_beverage,color: color,)),
            CardDesign1("Pickle",Icon(Icons.emoji_food_beverage,color: color,)),
            CardDesign1("Meals",Icon(Icons.emoji_food_beverage,color: color,)),
            CardDesign1("Ladoo",Icon(Icons.emoji_food_beverage,color: color,)),
            CardDesign1("Mixture",Icon(Icons.emoji_food_beverage,color: color,)),
            CardDesign1("Unniyappam",Icon(Icons.emoji_food_beverage,color: color,)),
            CardDesign1("Cake",Icon(Icons.cake,color: color,))
          ],
        ),
      ),
    );
  }

  Widget CardDesign1(String text,Icon icon){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(
              width: 5,
            ),
            Text(text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }

}
