
import 'package:flutter/material.dart';

import 'WeatherDetails.dart';

class WeatherInput extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Entrez la ville',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Chercher '),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherDetails(
                      myCity: textController.text,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



