import 'package:flutter/material.dart';
import 'package:trilink_assignment/profile/widgets/profile_info_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),

              SizedBox(height: 20),

              //Profile picture with edit icon
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        'assets/images/profile.jpg',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.mode_edit_outlined, size: 18),
                    ),
                  ),
                ],
              ),

              //Personal info card
              Card(
                margin: const EdgeInsets.all(16),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Personal info',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(onPressed: () {}, child: Text('Edit')),
                        ],
                      ),
                      //Name with icon
                      ProfileInfoRow(
                        icon: Icons.person_4_outlined,
                        title: 'Name',
                        value: 'Terry Melton',
                      ),
                      SizedBox(height: 20),
                      //Email with icon
                      ProfileInfoRow(
                        icon: Icons.email_outlined,
                        title: 'E-mail',
                        value: 'melton89@gmail.com',
                      ),
                      SizedBox(height: 20),
                      //Phone with icon
                      ProfileInfoRow(
                        icon: Icons.phone_outlined,
                        title: 'Phone number',
                        value: '+1 201 555-0123',
                      ),
                      SizedBox(height: 20),
                      //Address with icon
                      ProfileInfoRow(
                        icon: Icons.home_outlined,
                        title: 'Home Address',
                        value:
                            '70 Rainey Street, Apartment 146, Austin, TX 78701',
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              //Account info card
              Card(
                margin: const EdgeInsets.all(16),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Account info',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF00B686),
        unselectedItemColor: Colors.grey[500],
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_alt),
            label: 'Transfer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: 4,
      ),
    );
  }
}
