
import 'package:flutter/material.dart' hide Colors;
import '../res/colors.dart';
// import 'package:flutter/material.dart';

class DetailTag extends StatelessWidget {
  const DetailTag({
    Key? key,
    required this.title,
    required this.descriptition,
  }) : super(key: key);

  final String title;
  final String descriptition;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${title}: ',
          style: TextStyle(fontSize: 18,fontFamily: 'Lucida', fontWeight: FontWeight.w600),
        ),
        Text(
          '${descriptition}',
          style: TextStyle(fontFamily: 'roboto',fontSize: 18,),
        ),
      ],
    );
  }
}


class DescriptionTag extends StatelessWidget {
  const DescriptionTag({
    Key? key,
    required this.title,
    required this.descriptition,
  }) : super(key: key);

  final String title;
  final String descriptition;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}: ',
            style: TextStyle(fontSize: 18,fontFamily: 'Lucida', fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              '${descriptition}',
              style: TextStyle(fontFamily: 'roboto',fontSize: 18,),
            ),
          ),
        ],
      ),
    );
  }
}




class QuarterCircleClipper extends CustomClipper<Path> {
  final double sizeOfCut;

  QuarterCircleClipper({required this.sizeOfCut});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0.0)
      // Top mid
      // ..moveTo(sizeOfCut, 0.0)
      ..lineTo(size.width * 0.65 - sizeOfCut * 0.75, 0.0)
      ..arcToPoint(
        Offset(size.width * 0.65 + sizeOfCut * 0.75, 0),
        radius: Radius.circular(sizeOfCut / 2),
        clockwise: false,
      )
      ..lineTo(size.width, 0.0)
      // Top right
      // ..moveTo(sizeOfCut, 0.0)
      // ..lineTo(size.width - sizeOfCut, 0.0)
      // ..arcToPoint(
      //   Offset(size.width, sizeOfCut),
      //   radius: Radius.circular(sizeOfCut),
      //   clockwise: false,
      // )

      // Center right
      // ..lineTo(size.width, size.height * 0.50 - sizeOfCut * 0.75)
      // ..arcToPoint(
      //   Offset(size.width, size.height * 0.50 + sizeOfCut * 0.75),
      //   radius: Radius.circular(sizeOfCut / 4),
      //   clockwise: false,
      // )
      ..lineTo(size.width, size.height)
      // Bottom right
      // ..lineTo(size.width, size.height - sizeOfCut)
      // ..arcToPoint(
      //   Offset(size.width - sizeOfCut, size.height),
      //   radius: Radius.circular(sizeOfCut),
      //   clockwise: false,
      // )
      // Bottom mid
      ..lineTo(size.width * 0.65 + sizeOfCut * 0.75, size.height)
      ..arcToPoint(
        Offset(size.width * 0.65 - sizeOfCut * 0.75, size.height),
        radius: Radius.circular(sizeOfCut / 2),
        clockwise: false,
      )
      ..lineTo(0, size.height)
      // Bottom left
      // ..lineTo(sizeOfCut, size.height)
      // ..arcToPoint(
      //   Offset(0.0, size.height - sizeOfCut),
      //   radius: Radius.circular(sizeOfCut),
      //   clockwise: false,
      // )

      // Center left
      // ..lineTo(00, size.height * 0.50 + sizeOfCut * 0.75)
      // ..arcToPoint(
      //   Offset(00, size.height * 0.50 - sizeOfCut * 0.75),
      //   radius: Radius.circular(sizeOfCut / 4),
      //   clockwise: false,
      // )

      // Top left
      ..lineTo(0.0, sizeOfCut)
      // ..arcToPoint(
      //   Offset(sizeOfCut, 0.0),
      //   radius: Radius.circular(sizeOfCut),
      //   clockwise: false,
      // )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyDashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  MyDashedBorderPainter({required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5.0; // Adjust the width of each dash
    final double dashSpace = 5.0; // Adjust the space between dashes

    double currentY = 0.0;

    while (currentY < size.height) {
      canvas.drawLine(Offset(currentY, size.height),
          Offset(currentY + dashWidth, size.height), paint);
      currentY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyLinearBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  MyLinearBorderPainter({required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    final double dashWidth = 5.0; // Adjust the width of each dash

    double currentX = 0.0;

    while (currentX < size.width) {
      canvas.drawLine(Offset(currentX, size.height),
          Offset(currentX + dashWidth, size.height), paint);
      currentX += dashWidth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}




class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.65);
    path.quadraticBezierTo(
        size.width, size.height * 0.5, size.width * 0.75, size.height * 0.5);
    path.lineTo(size.width * 0.25, size.height * 0.5);
    path.quadraticBezierTo(0, size.height * 0.5, 0, size.height * 0.35);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class InvertedCustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(
        0, size.height * 0.5, size.width * 0.25, size.height * 0.5);
    path.lineTo(size.width * 0.75, size.height * 0.5);
    path.quadraticBezierTo(
        size.width, size.height * 0.5, size.width, size.height * 0.65);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ProgressIndication extends StatelessWidget {
  const ProgressIndication({
    Key? key,
    required this.confirmedValue,
    required this.totalValue,
    required this.strokeWidth,
  }) : super(key: key);

  final double confirmedValue;
  final double totalValue;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 140.0,
      child: Stack(
        children: [
          // Background circle
          Container(
            width: 120.0,
            height: 140.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
          ),
          // Progress indicator
          Positioned.fill(
            child: CircularProgressIndicator(
              value: confirmedValue / totalValue,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              strokeWidth: strokeWidth,
              strokeCap: StrokeCap.square,
            ),
          ),
          // Center data display
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(confirmedValue).toInt()}',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                // Container(
                //   child: Text(
                //     '--------',
                //     style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.white),
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 2))),
                  child: Text(
                    '${(totalValue).toInt()}',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
