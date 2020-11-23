import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>   with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 0.8);
  TabController _tabController;

  int index = 0;

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: <Widget>[
                    Text('Categories',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(width: 32),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        width: 222,
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset('assets/icons/search.svg'),
                              ),
                              contentPadding: EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              hintText: 'Search an item'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TabBar(
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(
                  fontSize: 20,
                ),
                indicator: CircleTabIndicator(color: Colors.black, radius: 3),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                tabs: [
                  Tab(text: 'Tables'),
                  new Tab(text: 'Chairs'),
                  new Tab(text: 'Cabinets'),
                  new Tab(text: 'Lampstands'),
                  new Tab(
                    text: 'Beds'
                  ),
                ],
                controller: _tabController,
                onTap: (index){
                  // TODO: set dynamic data
                },
                indicatorColor: Colors.white,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 275,
                              child: PageView(
                                physics: BouncingScrollPhysics(),
                    controller: controller,
                    // TODO: set dynamic data
                    children: List.generate(
                        6,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                                child: Image.asset('assets/images/Frame ${index % 2 == 0 ? 1 : 2}.png', fit: BoxFit.cover,),
                              ),
                        )),
                  ),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 6,
                  effect: ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: Color(0xFF6E3B3B),
                    dotColor: Color(0xFFB69D9D),
                    expansionFactor: 4,
                  ),
                ),
              ),
              ],),
             
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Best Sellers', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),

            Column(children: [
              for(int i = 0; i < 10; i ++)
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 178, child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/Frame 1.png',))
                        ), height: 124,)),
                      Expanded(flex: 204, child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Akinwale Olawale', style: TextStyle(fontSize: 24, color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Lagos, Nigeria.', style: TextStyle(fontSize: 16, color: Colors.white)),
                            ),
                          ]
                        ),
                        color: Color(0xFFAC3F21), height: 124,))
                    ]
                  )
                ),
          )
            ])
            ],
          ),
        ),
      );
  }
}


class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
