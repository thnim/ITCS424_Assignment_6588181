# Student Information
Name: Nimmida Maneewan
Student ID: 6588181
Section: 3

# Pages Implemented
1. Page Name: Doctor List Page
Description: The doctor page shows a list of doctors under a selected department (e.g., Ear, Nose & Throat). Users can filter doctors based on availability and gender, and sort them by rating. Each doctor item includes their name, specialty, photo, and rating. Tapping a doctor navigates to the appointment selection page.
2. Page Name: Appointment Selection Page (Appointment Detail Page)
Description: The appointment selection page shows detailed information about the selected doctor and allows users to book an appointment by choosing a date and available time slot. After selection, the user can press the “Confirm” button to finalize the booking.

# Features and Widgets Used
•	Widgets:
  o	StatelessWidget, StatefulWidget
  o	Text, Icon, Image, ListTile, DropdownButton, ElevatedButton, TextField, GestureDetector
  o	ListView, Wrap, SizedBox, ClipRRect, Spacer
•	Layout Elements:
  o	Column
  o	Row
  o	Container
  o	Padding
  o	Expanded
  o	EdgeInsets
•	Material Design Components:
  o	AppBar
  o	BottomNavigationBar
  o	ElevatedButton
  o	DropdownButton
  o	ListTile
  o	TextField
•	Navigation:
  o	Navigator.push for screen transitions
  o	BottomNavigationBar for switching between pages
•	State Management:
  o	Used setState() in stateful widgets to manage filters, time/date selections, and dynamic UI updates

# Known Issues or Limitations
•	The placeholder pages (Calendar, History, Chat, Account) are not yet implemented.
•	No backend integration as booking confirmation is currently visual only with no real data storage.
•	Image assets must be correctly configured in pubspec.yaml to display properly.

# Reflection
1. What did you find most challenging about this project?
	The most challenging part was implementing the filter buttons and making them interact with the doctor list correctly. It also took some time to align the layout elements neatly, especially combining text and images within the list tiles.
2. Which widgets or design elements are you most proud of using?
	I’m most proud of the Doctor List Page, particularly how it dynamically filters and sorts the doctor list based on user input. I also liked how the date and time selection UI turned out on the Appointment Selection Page.
3. What would you add or improve with more time?
•	Add backend integration to save and retrieve appointment data.
•	Implement the remaining placeholder pages (Calendar, History, etc.)
•	Add message “Booking is confirmed!” using a snackbar after booking confirmation.
•	Improve responsiveness for different screen sizes.
•	Implement the search functionality to filter doctors by name, since the search bar currently doesn't work.
