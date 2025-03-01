import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/widgets/bottom_nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedLanguage = "English 🇺🇸";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'My Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
              iconSize: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/img_1.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Trump US",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Customer since Dec, 2024",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        children: [
                          Icon(Icons.phone, color: Colors.white70, size: 16),
                          SizedBox(width: 5),
                          Text("+855 11 001 007", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            _buildMenuItem(Icons.payment, "Payment Methods", iconColor: Colors.green),
            _buildMenuItem(Icons.account_balance_wallet, "Outstanding Payment", iconColor: Colors.green),
            _buildMenuItem(Icons.card_giftcard, "My Coupon", iconColor: Colors.green),
            _buildMenuItem(Icons.currency_exchange_outlined ,"Refund Preference", iconColor: Colors.green),
            _buildMenuItem(Icons.location_on, "My Addresses", iconColor: Colors.green),
            _buildMenuItem(Icons.star, "GO PRIME", iconColor: Colors.green),
            _buildMenuItem(Icons.notifications, "Notification Settings", iconColor: Colors.green),
            _buildMenuItem(Icons.contact_phone, "Emergency Contact", iconColor: Colors.green),
            _buildMenuItem(Icons.feedback, "Feedback", iconColor: Colors.green),
            _buildMenuItem(Icons.lock, "Set Password", onTap: _showSetPasswordDialog, iconColor: Colors.green),
            _buildMenuItem(Icons.language, "Language ($selectedLanguage)", onTap: _showLanguageDialog, iconColor: Colors.green),
            const SizedBox(height: 20),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap, Color? iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black54),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap ?? () {
        _navigateTo(title);
      },
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        ),
        icon: const Icon(Icons.logout, color: Colors.white),
        label: const Text(
          "Logout",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: _showLogoutDialog,
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Logout",
            textAlign: TextAlign.center,
          ),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    Future.delayed(const Duration(milliseconds: 100), () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Logged Out Successfully")),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  child: const Text("Ok", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }



  void _navigateTo(String title) {
    if (title == "Payment Methods") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodsScreen()));
    } else if (title == "Outstanding Payment") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => OutstandingPaymentScreen()));
    } else if (title == "My Coupon") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyCouponScreen()));
    } else if (title == "Refund Preference") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => RefundPreferenceScreen()));
    } else if (title == "My Addresses") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyAddressesScreen()));
    } else if (title == "GO PRIME") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GoPrimeScreen()));
    } else if (title == "Notification Settings") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsScreen()));
    } else if (title == "Emergency Contact") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyContactScreen()));
    } else if (title == "Feedback") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen()));
    }
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption("English 🇺🇸"),
              _buildLanguageOption("中文 🇨🇳"),
              _buildLanguageOption("France 🇫🇷"),
              _buildLanguageOption("Espan 🇪🇸"),
              _buildLanguageOption("Khmer 🇰🇭"),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String language) {
    return ListTile(
      title: Text(language),
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
        Navigator.pop(context);
      },
    );
  }

  void _showSetPasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Set Password",textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter new password",
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm new password",
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 20), // Spacer between buttons
                ElevatedButton(
                  onPressed: () {
                    // Implement password change logic here
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Password updated successfully")),
                    );
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text("Welcome to the Home Screen")),
    );
  }
}

class PaymentMethodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Payment Methods")));
  }
}

class OutstandingPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Outstanding Payment")));
  }
}

class MyCouponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("My Coupon")));
  }
}

class RefundPreferenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Refund Preference")));
  }
}

class MyAddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("My Addresses")));
  }
}

class GoPrimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("GO PRIME")));
  }
}

class NotificationSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Notification Settings")));
  }
}

class EmergencyContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Emergency Contact")));
  }
}

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Feedback")));
  }
}
