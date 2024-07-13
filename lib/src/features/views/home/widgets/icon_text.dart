import 'package:flutter/material.dart';

class IconTextContainer extends StatelessWidget {
  final IconData icon;
  final String label;

  IconTextContainer({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.43,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withOpacity(0.5),
        border: Border.all(color: Colors.grey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              size: 40,
              color: Theme.of(context).primaryColorDark,
            ),
            SizedBox(
                height:
                    10), // You can adjust the spacing between the icon and text
            Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
