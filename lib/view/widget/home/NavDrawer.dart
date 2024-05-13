import 'package:suezproduction/view/screen/AboutUs.dart';
import 'package:suezproduction/view/screen/Branches.dart';
import 'package:suezproduction/view/screen/CheckPolicy.dart';
import 'package:suezproduction/view/screen/onlinepay.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'القائمة',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
             ListTile(
            leading: Icon(Icons.view_compact),
            title: Text('من نحن'),
            onTap: () => {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUs()))},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('التأكد من صحة الوثيقة'),
            onTap: () => {   Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckPolicy()))},
          ),
          ListTile(
            leading: Icon(Icons.shopify_rounded),
            title: Text('سداد الوثيقة أون لاين'),
            onTap: () => {    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnLinepay()))},
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('فروع الشركة'),
            onTap: () => {  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Branches()))},
          ),

        ],
      ),
    );
  }
}