import 'package:flutter/material.dart';

class AppointmentSelectionPage extends StatefulWidget {
  final String name;
  final String specialty;
  final String image;
  final double rating;

  const AppointmentSelectionPage({
    required this.name,
    required this.specialty,
    required this.image,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  _AppointmentSelectionPageState createState() =>
      _AppointmentSelectionPageState();
}

class _AppointmentSelectionPageState extends State<AppointmentSelectionPage> {
  String selectedTime = '';
  String selectedDate = 'Tue5';

  final List<Map<String, dynamic>> dates = [
    {'label': 'Sun', 'day': '3'},
    {'label': 'Mon', 'day': '4'},
    {'label': 'Tue', 'day': '5'},
    {'label': 'Wed', 'day': '6'},
    {'label': 'Thu', 'day': '7'},
  ];

  final List<String> morning = ['9:00 AM', '9:30 AM', '10:00 AM', '10:30 AM'];
  final List<String> afternoon = ['1:30 PM', '2:30 PM', '3:00 PM', '4:30 PM'];
  final List<String> evening = ['6:30 PM', '7:00 PM', '7:30 PM', '8:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Book Appointment', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.image,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.specialty,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        SizedBox(width: 4),
                        Text(widget.rating.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('Appointment', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 6),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    dates.map((date) {
                      final dateText = '${date['label']}${date['day']}';
                      final isSelected = dateText == selectedDate;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = dateText;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? Colors.lightBlue
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            dateText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Available Time',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            buildTimeSection('Morning', morning),
            buildTimeSection('Afternoon', afternoon),
            buildTimeSection('Evening', evening),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {},
                child: Text('Confirm'),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget buildTimeSection(String title, List<String> times) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children:
              times.map((time) {
                final isSelected = selectedTime == time;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.orange.shade200 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            isSelected ? Colors.orange : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
