import 'package:flutter/material.dart';

class CustomListCard extends StatelessWidget {
  final Widget leadingIcon;
  final Widget cardTitle;
  final Widget cardSubtitle;
  final Function onTap;

  CustomListCard(
      {this.leadingIcon, this.cardTitle, this.cardSubtitle, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          elevation: 5.0,
          child: ListTile(
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: leadingIcon,
            ),
            contentPadding: EdgeInsets.all(15.0),
            title: cardTitle,
            subtitle: cardSubtitle,
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: onTap,
            enabled: onTap == null ? false : true,
          ),
        ),
      ),
    );
  }
}
