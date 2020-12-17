import 'package:flutter/material.dart';
import 'dart:math';
import 'package:furniture_app/ui/widgets/buttons.dart';

class CustomNavBar extends StatefulWidget {
  final List<Widget> customNavBarItems;

  const CustomNavBar({Key key, this.customNavBarItems}) : super(key: key);
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned(top: -33, child: customButton()),
        Container(
          height: 64,
          child: CustomPaint(
            painter:
                BottomNavPainter(color: Color(0xFFF3CF7A), avatarRadius: 38),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.customNavBarItems),
          ),
        ),
      ],
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  final Widget selectedIcon;
  final Widget unselectedIcon;
  final VoidCallback onTap;
  final int index, currentIndex;

  CustomNavBarItem(
      {this.selectedIcon,
      this.unselectedIcon,
      this.onTap,
      this.index,
      this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: index == currentIndex ? selectedIcon : unselectedIcon,
      onTap: onTap,
    );
  }
}

class BottomNavPainter extends CustomPainter {
  BottomNavPainter({@required this.color, @required this.avatarRadius});

  final Color color;
  final double avatarRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);

    final centerAvatar = Offset(shapeBounds.center.dx, shapeBounds.top);

    final avatarBounds =
        Rect.fromCircle(center: centerAvatar, radius: avatarRadius);

    _drawBackground(canvas, shapeBounds, avatarBounds);
  }

  
  @override
  bool shouldRepaint(BottomNavPainter oldDelegate) {
    return color != oldDelegate.color;
  }

  void _drawBackground(Canvas canvas, Rect shapeBounds, Rect avatarBounds) {
    
    final paint = Paint()..color = color;

    
    final backgroundPath = Path()
      ..moveTo(shapeBounds.left, shapeBounds.top)
      ..arcTo(avatarBounds, pi, -pi, false)
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy)
      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy)
      ..close();

    
    canvas.drawPath(backgroundPath, paint);
  }
}
