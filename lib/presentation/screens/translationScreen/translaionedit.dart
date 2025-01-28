import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:savvyflos/core/utils/colors_manager.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  String inputText = '';
  String translatedText = '';
  bool isLoading = false;

  Future<void> translateText() async {
    final url = Uri.parse('https://example.com/api/translate');
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'text': inputText}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          translatedText = data['translated_text'] ?? 'Translation not available';
        });
      } else {
        setState(() {
          translatedText = 'Error: Unable to translate';
        });
      }
    } catch (error) {
      setState(() {
        translatedText = 'Error: $error';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    value: 'English',
                    dropdownColor: ColorsManager.b3,
                    items: ['English', 'Sign Language']
                        .map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: ColorsManager.b1, fontSize: 22),
                        ),
                      );
                    })
                        .toList(),
                    onChanged: (String? newValue) {},
                    icon: Icon(Icons.arrow_drop_down, color: ColorsManager.b1),
                  ),
                  Icon(Icons.swap_horiz, color: ColorsManager.b1),
                  DropdownButton(
                    value: 'Sign Language',
                    dropdownColor: ColorsManager.b3,
                    items: ['Sign Language', 'English']
                        .map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: ColorsManager.b1, fontSize: 22),
                        ),
                      );
                    })
                        .toList(),
                    onChanged: (String? newValue) {},
                    icon: Icon(Icons.arrow_drop_down, color: ColorsManager.b1),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorsManager.b3,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  maxLines: 4,
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter text',
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    inputText = value;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading ? null : translateText,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  backgroundColor: ColorsManager.b1
                ),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Translate', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  translatedText.isNotEmpty
                      ? translatedText
                      : '',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 22),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: ColorsManager.b2,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone, color: Colors.white),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.white),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
