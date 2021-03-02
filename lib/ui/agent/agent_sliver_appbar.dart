import 'package:flutter/material.dart';
import 'package:temancurhat/shared/styles/styles.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          color: MyColors.bgYellow,
          height: MediaQuery.of(context).size.width / 3,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          bottom: 0.0,
          right: 20.0,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Image.asset('assets/images/foto_agent.png'),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
