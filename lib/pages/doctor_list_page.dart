import 'package:flutter/material.dart';
import 'appointment_selection_page.dart';

class DoctorListPage extends StatefulWidget {
  @override
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  String selectedAvailability = 'All';
  String selectedGender = 'All';
  String selectedSort = 'None';

  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. Patricia Ahoy',
      'specialty': 'Ear, Nose & Throat specialist',
      'image': 'assets/image/doctor1.jpg',
      'gender': 'Female',
      'available': false,
      'rating': 4.5,
    },
    {
      'name': 'Dr. Stone Gaze',
      'specialty': 'Ear, Nose & Throat specialist',
      'image': 'assets/image/doctor2.jpg',
      'gender': 'Female',
      'available': false,
      'rating': 4.1,
    },
    {
      'name': 'Dr. Wahyu',
      'specialty': 'Ear, Nose & Throat specialist',
      'image': 'assets/image/doctor3.jpeg',
      'gender': 'Male',
      'available': false,
      'rating': 4.3,
    },
    {
      'name': 'Dr. Reza Razor',
      'specialty': 'Ear, Nose & Throat specialist',
      'image': 'assets/image/doctor4.jpeg',
      'gender': 'Male',
      'available': true,
      'rating': 4.8,
    },
    {
      'name': 'Dr. Jacky Cun',
      'specialty': 'Ear, Nose & Throat specialist',
      'image': 'assets/image/doctor5.jpeg',
      'gender': 'Male',
      'available': true,
      'rating': 4.9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredDoctors = [...doctors];

    if (selectedAvailability == 'Available Today') {
      filteredDoctors =
          filteredDoctors.where((doc) => doc['available']).toList();
    }

    if (selectedGender == 'Male' || selectedGender == 'Female') {
      filteredDoctors =
          filteredDoctors
              .where((doc) => doc['gender'] == selectedGender)
              .toList();
    }

    if (selectedSort == 'Most') {
      filteredDoctors.sort((b, a) => a['rating'].compareTo(b['rating']));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Ear, Nose & Throat',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Doctor',
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.filter_alt_outlined),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                buildDropdown(
                  selectedAvailability,
                  ['All', 'Available Today'],
                  (val) {
                    setState(() => selectedAvailability = val!);
                  },
                ),
                buildDropdown(selectedGender, ['All', 'Male', 'Female'], (val) {
                  setState(() => selectedGender = val!);
                }),
                buildDropdown(selectedSort, ['None', 'Most'], (val) {
                  setState(() => selectedSort = val!);
                }),
              ],
            ),
            SizedBox(height: 12),
            ...filteredDoctors.map((doctor) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      doctor['image'],
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    doctor['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    doctor['specialty'],
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      SizedBox(width: 4),
                      Text(
                        doctor['rating'].toString(),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AppointmentSelectionPage(
                              name: doctor['name'],
                              specialty: doctor['specialty'],
                              image: doctor['image'],
                              rating: doctor['rating'],
                            ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            icon: Icon(Icons.keyboard_arrow_down),
            isExpanded: true,
            onChanged: onChanged,
            items:
                items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, overflow: TextOverflow.ellipsis),
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
