import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            // Profile picture with border
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.yellow, width: 4),
              ),
              child: const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/1200x/34/0b/92/340b923bbc183f7568a7ad419e13a06d.jpg'), // Corrected URL with .jpg
              ),
            ),
            const SizedBox(height: 20),
            // User's name
            const Text(
              'Moo Nha',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // User's email
            const Text(
              'nahnha@gmail.com',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            // Additional info or buttons
            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone Number'),
                subtitle: Text('+855 169 898'),
              ),
            ),
            const SizedBox(height: 15),
            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Location'),
                subtitle: Text('123 Main Street, City'),
              ),
            ),
            const SizedBox(height: 40),
            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    // Implement edit functionality here
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    // Implement logout functionality here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
