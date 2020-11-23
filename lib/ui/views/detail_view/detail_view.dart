import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/ui/widgets/buttons.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            height: height/2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/images/Frame 1.png'),
                    fit: BoxFit.cover)),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.arrow_back_ios, color: Colors.black,),
                    Text(
                      'Executive Removable Table',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.local_grocery_store, color: Colors.black), 
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 40,
                  child: Container(
                    child: Center(child: Text('₦15 000', style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFF3CF7A)))),
              
            ]),
          ),
          SizedBox(height: height),
          Positioned(
            bottom: 0,
                child: Container(
                  height: height/2 + 10,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                    color: Color(0xFFFBEED0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                              CircleAvatar(radius: 32,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ayanfe Nwankwo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                  Text('Lagos, Nigeria', style: TextStyle(color: Color.fromARGB(51, 51, 1, 51), fontSize: 16),)
                                ]
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset('assets/star.svg'),
                                  Text('4/5')
                                ]
                              )
                            ],),
                            SizedBox(height: 20),
                            Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            SizedBox(height: 8),
                            Text('3 months old reading table, suitable for work place, home, library and stores to suit your style and make you feel like the Boss which you are.',
                            style: TextStyle(color: Color.fromARGB(51, 51, 1, 51)),),
                          ],
                        ),
                      ),
                      
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                            color: Color(0xFFAC3F21),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      SizedBox(width: 16),
                                    changeQuantityButton('-', (){}),
                                      SizedBox(width: 16),
                                    Text('2', style: TextStyle(color: Colors.white)),
                                      SizedBox(width: 16),
                                    changeQuantityButton('+', (){}),
                                    ],),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text('Total: ₦30 000', style: TextStyle(color: Colors.white)),
                                    ) 
                                ],),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                   primaryButton('ADD TO CART')
                                ],),
                              ),
                            ]
                          ),
                        ),
                      )
                    ]
                  ),
                ),
              )
        ],
      )),
    );
  }
}
