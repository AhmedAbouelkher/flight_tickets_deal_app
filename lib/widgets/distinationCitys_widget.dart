import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../appTheme.dart';
import 'mainSearch_widget.dart';

class ChoosingCity extends StatelessWidget {
  const ChoosingCity({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -0.98),
      child: Container(
        height: height * 0.14,
        width: width - 50,
        child: Card(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimatedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        Provider.of<Searching>(context).fromLocationCity,
                        style: AppTheme()
                            .mainPopUpMenuTextStyle
                            .copyWith(fontSize: 17),
                      ),
                      Container(
                        color: Colors.black12,
                        width: width * 0.50,
                        height: 1,
                      ),
                      Text(
                        Provider.of<Searching>(context).toLocationCity,
                        style: AppTheme().mainPopUpMenuTextStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                      ),
                    ],
                  ),
                  duration: Duration(milliseconds: 200),
                ),
                Transform.rotate(
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      Icons.compare_arrows,
                      color: Colors.black54,
                      size: 35,
                    ),
                    onPressed: () {
                      Provider.of<Searching>(context, listen: false)
                          .changeCitysOrder();
                    },
                  ),
                  angle: math.pi / 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
