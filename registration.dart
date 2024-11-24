import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
// ignore: duplicate_import
import 'login.dart'; // Import the LoginScreen class

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _divisionController = TextEditingController();
  final TextEditingController _enrollmentController = TextEditingController();

  void _registerAndNavigate() {
    String name = _nameController.text.trim();
    String mobile = _mobileController.text.trim();
    String email = _emailController.text.trim();
    String department = _departmentController.text.trim();
    String division = _divisionController.text.trim();
    String enrollment = _enrollmentController.text.trim();

    if (name.isNotEmpty &&
        mobile.isNotEmpty &&
        email.isNotEmpty &&
        department.isNotEmpty &&
        division.isNotEmpty &&
        enrollment.isNotEmpty) {
      // Registration logic (e.g., save to Firebase or local database)

      // Navigate to the StudentHomePage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => home(
            userId: enrollment, // Pass enrollment number as userId
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields.")),
      );
    }
  }

  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoginScreen()), // Navigate to login page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // TextFields for user inputs
                _buildTextField("Name", Icons.person, _nameController),
                SizedBox(height: 10),
                _buildTextField(
                    "Mobile Number", Icons.phone, _mobileController),
                SizedBox(height: 10),
                _buildTextField("Email ID", Icons.email, _emailController),
                SizedBox(height: 10),
                _buildTextField(
                    "Department", Icons.apartment, _departmentController),
                SizedBox(height: 10),
                _buildTextField("Division", Icons.group, _divisionController),
                SizedBox(height: 10),
                _buildTextField(
                    "Enrollment Number", Icons.school, _enrollmentController),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _registerAndNavigate,
                  child: Text("Submit"),
                ),
                SizedBox(height: 20),
                // Link to login page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You have already an account? "),
                    GestureDetector(
                      onTap: _navigateToLogin,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData icon, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  home({required String userId}) {}
}

class StudentHomePage {}
