import 'package:flutter/material.dart';
import 'package:temancurhat/shared/styles/styles.dart';

import 'text_widget.dart';

class CardPost extends StatelessWidget {
  final String title;
  final String deskripsi;

  const CardPost({
    Key key,
    this.title,
    this.deskripsi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 175,
              color: MyColors.grey,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: title,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: MyColors.darkGrey,
                    ),
                    SizedBox(height: 10),
                    TextWidget(
                      text: deskripsi,
                      fontSize: 14.0,
                      color: MyColors.darkGrey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
