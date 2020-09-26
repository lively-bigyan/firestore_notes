import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  static const double _fabDimension = 60.0;
  final Widget page;
  CustomFAB({this.page});
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (BuildContext context, VoidCallback _) {
        return page;
      },
      closedElevation: 6.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_fabDimension / 2),
        ),
      ),
      closedColor: Theme.of(context).primaryColor,
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return const SizedBox(
          height: _fabDimension,
          width: _fabDimension,
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
