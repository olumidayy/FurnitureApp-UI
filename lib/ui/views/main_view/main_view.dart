import 'package:flutter/material.dart';
import 'package:furniture_app/ui/views/detail_view/detail_view.dart';
import 'package:furniture_app/ui/views/home/home.dart';
import 'package:furniture_app/ui/widgets/bottom_nav.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  MainView({
    Key key,
  }) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 0.8);

  int index = 0;

  List<Widget> views = [
    HomePage(),
    DetailView()
  ];

  void _setIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBEED0),
      body: HomePage(),
      bottomNavigationBar: CustomNavBar(
        customNavBarItems: <Widget>[
          CustomNavBarItem(
            selectedIcon: SvgPicture.asset('assets/home.svg'),
            unselectedIcon: SvgPicture.asset('assets/home_outline.svg'),
            index: 0,
            currentIndex: index,
            onTap: () => _setIndex(0),
          ),
          CustomNavBarItem(
            selectedIcon: SvgPicture.asset('assets/cart.svg'),
            unselectedIcon: SvgPicture.asset('assets/cart_outline.svg'),
            index: 1,
            currentIndex: index,
            onTap: () => _setIndex(1),
          ),
          SizedBox(width: 20),
          CustomNavBarItem(
            selectedIcon: Icon(Icons.person, size: 35,),
            unselectedIcon: Icon(Icons.person_outline, size: 35,),
            index: 2,
            currentIndex: index,
            onTap: () => _setIndex(2),
          ),
          CustomNavBarItem(
            selectedIcon: Icon(Icons.favorite, size: 32,),
            unselectedIcon: Icon(Icons.favorite_border, size: 32,),
            index: 3,
            currentIndex: index,
            onTap: () => _setIndex(3),
          ),
        ],
      ),
    );
  }
}
