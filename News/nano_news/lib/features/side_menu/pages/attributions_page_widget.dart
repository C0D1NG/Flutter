import 'package:flutter/material.dart';
import 'package:nano_news/utility/app_theme.dart';

class AttributionsPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attributions'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.attribution_rounded),
                      title: Text('The New York Times'),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Version: 1.0.0',
                style: TextStyle(color: Colors.grey[400], fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
