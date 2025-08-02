import '../login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool pushNotifications = true;
  bool soundAlerts = false;
  bool locationServices = true;
  String selectedLanguage = 'English';
  String syncFrequency = 'Daily';

  final List<String> languages = ['English', 'Hindi', 'Punjabi', 'Marathi'];
  final List<String> syncOptions = ['Hourly', 'Daily', 'Weekly', 'Manual'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft, color: Colors.black),
          onPressed: () => Navigator.pop(context, 'back_to_home'),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader("Appearance"),
              _buildSettingsCard(
                title: "Dark Theme",
                subtitle: "Switch between light and dark mode",
                icon: FontAwesomeIcons.moon,
                trailing: Switch(
                  value: false,
                  activeColor: const Color(0xFF328E6E),
                  onChanged: null,
                ),
              ),
              const Divider(height: 1, color: Colors.grey),
              const SizedBox(height: 24),
              _buildSectionHeader("Notifications"),
              _buildSettingsCard(
                title: "Push Notifications",
                subtitle: "Receive app notifications",
                icon: FontAwesomeIcons.bell,
                trailing: Switch(
                  value: pushNotifications,
                  activeColor: const Color(0xFF328E6E),
                  onChanged: (bool value) {
                    setState(() {
                      pushNotifications = value;
                    });
                  },
                ),
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildSettingsCard(
                title: "Sound Alerts",
                subtitle: "Enable sound for notifications",
                icon: FontAwesomeIcons.volumeHigh,
                trailing: Switch(
                  value: soundAlerts,
                  activeColor: const Color(0xFF328E6E),
                  onChanged: (bool value) {
                    setState(() {
                      soundAlerts = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("Language"),
              _buildSettingsCard(
                title: "Change Language",
                subtitle: "Select your preferred language",
                icon: FontAwesomeIcons.language,
                trailing: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: selectedLanguage,
                  underline: const SizedBox(),
                  icon: const FaIcon(FontAwesomeIcons.chevronDown,
                      size: 16, color: Color(0xFF328E6E)),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedLanguage = newValue;
                      });
                    }
                  },
                  items: languages
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("Data Sync"),
              _buildSettingsCard(
                title: "Sync Frequency",
                subtitle: "How often to sync your data",
                icon: FontAwesomeIcons.arrowsRotate,
                trailing: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: syncFrequency,
                  underline: const SizedBox(),
                  icon: const FaIcon(FontAwesomeIcons.chevronDown,
                      size: 16, color: Color(0xFF328E6E)),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        syncFrequency = newValue;
                      });
                    }
                  },
                  items: syncOptions
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("General"),
              _buildSettingsCard(
                title: "Location Services",
                subtitle: "Enable location-based weather updates",
                icon: FontAwesomeIcons.locationDot,
                trailing: Switch(
                  value: locationServices,
                  activeColor: const Color(0xFF328E6E),
                  onChanged: (bool value) {
                    setState(() {
                      locationServices = value;
                    });
                  },
                ),
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildSettingsCard(
                title: "Clear Cache",
                subtitle: "Remove temporary app data",
                icon: FontAwesomeIcons.trashCan,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Cache cleared successfully!"),
                      backgroundColor: Color(0xFF328E6E),
                    ),
                  );
                },
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildSettingsCard(
                title: "Contact Support",
                subtitle: "Get help from our team",
                icon: FontAwesomeIcons.headset,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Contact support at support@example.com"),
                      backgroundColor: Color(0xFF328E6E),
                    ),
                  );
                },
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildSettingsCard(
                title: "About",
                subtitle: "App version 1.0.0, developed by\nUjjwal Lamba",
                icon: FontAwesomeIcons.circleInfo,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Theme(
                        data: Theme.of(context)
                            .copyWith(dialogBackgroundColor: Colors.white),
                        child: const AboutDialog(
                          applicationName: "Digital Detox",
                          applicationVersion: "1.0.0",
                          applicationLegalese: "© 2025. All rights reserved.",
                        ),
                      );
                    },
                  );
                },
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildSettingsCard(
                title: "Sign Out",
                subtitle: "Log out of your account",
                icon: FontAwesomeIcons.rightFromBracket,
                onTap: () {
                  showDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text(
                        "Sign Out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      content: const Text(
                        "Are you sure you want to sign out?",
                        style: TextStyle(color: Colors.black87),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Color(0xFF328E6E)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                            // ScaffoldMessenger.of(context).showSnackBar(
                            // const SnackBar(
                            //   content: Text("Signed out successfully!"),
                            //   backgroundColor: Color(0xFF328E6E),
                            // ),
                            // );
                          },
                          child: const Text("Sign Out",
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildSettingsCard({
    required String title,
    required String subtitle,
    required IconData icon,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: FaIcon(icon, color: const Color(0xFF328E6E), size: 24),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
