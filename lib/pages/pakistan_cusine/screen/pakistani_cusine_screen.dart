import 'package:flutter/material.dart';
import 'package:only_shef/widgets/custom_menu_button.dart';

class PakistaniCuisineScreen extends StatelessWidget {
  const PakistaniCuisineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          // ThreeGreenBarsScreen()
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ThreeGreenBarsApp(),
            // Header Image and Title
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/pakistani1.png', // Replace with cuisine image
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    "Pakistani Cuisine",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Chef Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ChefCard(
                    name: "Alex Bhatti",
                    rating: 4.5,
                    followers: 920,
                    description:
                        "I am a professional chef specializing in authentic flavors, bringing the taste of Pakistan to every bite.",
                    profileImage: 'https://via.placeholder.com/150',
                  ),
                  SizedBox(height: 16),
                  ChefCard(
                    name: "Sara Shaikh",
                    rating: 4.8,
                    followers: 650,
                    description:
                        "As a passionate chef, I craft traditional Sindhi Biryani and other cultural dishes filled with aroma and savory taste.",
                    profileImage: 'https://via.placeholder.com/150',
                  ),
                  SizedBox(height: 16),
                  ChefCard(
                    name: "Chris Bate",
                    rating: 4.2,
                    followers: 480,
                    description:
                        "An international chef who can't resist the exotic spices and flavors of Pakistani cuisine.",
                    profileImage: 'https://via.placeholder.com/150',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ChefCard extends StatelessWidget {
  final String name;
  final double rating;
  final int followers;
  final String description;
  final String profileImage;

  const ChefCard({
    required this.name,
    required this.rating,
    required this.followers,
    required this.description,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage(profileImage),
            ),
            SizedBox(width: 16),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "$rating",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.people, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text("$followers"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // Arrow Icon
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
