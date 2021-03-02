import 'package:flutter/material.dart';
import 'package:temancurhat/shared/widgets/widgets.dart';

class AgenWidget extends StatelessWidget {
  final String tipeAgen;
  final Image image;
  final Function onTap;

  const AgenWidget({Key key, this.tipeAgen, this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: image,
            ),
            TextWidget(
              text: tipeAgen,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
