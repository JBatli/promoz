import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedUserType = 'Customer';

  // Define unique GlobalKeys for widgets that might require them
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>(); // Example: for a Form widget if you add one
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Example: for the Scaffold

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor;
    IconData userTypeIcon;

    switch (_selectedUserType) {
      case 'Vendor':
        primaryColor = Colors.orange;
        userTypeIcon = Icons.store;
        break;
      case 'Admin':
        primaryColor = Colors.red;
        userTypeIcon = Icons.admin_panel_settings;
        break;
      case 'Customer':
      default:
        primaryColor = Colors.blue;
        userTypeIcon = Icons.person;
        break;
    }

    return Scaffold(
 key: _scaffoldKey, // Assign the unique scaffold key
 body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView( // Added SingleChildScrollView to prevent overflow
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image
                Image.asset(
                  'assets/images/discount_deals.png',
                  height: 200.0,
                ),
                const SizedBox(height: 16.0),
                Text(
 "Because we all deserve Promotions",
 style: TextStyle(
 fontSize: 22.0,
 fontWeight: FontWeight.w300, // Lighter weight for elegance
 fontStyle: FontStyle.italic, // Italic for a touch of elegance
 color: primaryColor, // Use primary color
 ),
 ),
 const SizedBox(height: 48.0), // Increased vertical spacing
 Card(
                  elevation: 6.0, // Increased elevation for a better frame
                  margin: const EdgeInsets.symmetric(horizontal: 8.0), // Reduced horizontal margin for mobile
                  shape: RoundedRectangleBorder( // Added rounded corners
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0), // Increased padding inside the card
                    child: Column( // Use a Column inside the Card
                      mainAxisSize: MainAxisSize.min, // Make the column take minimum space
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              userTypeIcon,
                              size: 30,
                              color: primaryColor,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedUserType,
                                decoration: InputDecoration(
                                  labelText: 'User Type',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0), // Rounded corners for input field
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0), // Adjusted padding
                                ),
                                items: <String>['Customer', 'Vendor', 'Admin']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _selectedUserType = newValue;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0), // Spacing between input fields
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email, color: primaryColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0), // Adjusted padding
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20.0), // Spacing between input fields
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock, color: primaryColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0), // Adjusted padding
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.0), // Spacing between card and login button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    textStyle: TextStyle(fontSize: 18),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Adjusted padding
                    shape: RoundedRectangleBorder( // Rounded corners for button
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    print('Logging in as $_selectedUserType with email: $email and password: $password');
                    // Capture email and navigate directly to customer dashboard for now
                    String capturedEmail = _emailController.text;
                    Navigator.pushNamed(context, '/customer_dashboard');
                  },
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    'Don\'t have an account? Sign up',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
