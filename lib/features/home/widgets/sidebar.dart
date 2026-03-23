import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Responsive.isDesktop(context)
        ? 260
        : Responsive.isTablet(context)
        ? 220
        : 260;

    return Container(
      width: width,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 40),
          _header(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                _MenuItem(
                  icon: Icons.dashboard,
                  title: "Dashboard",
                  active: true,
                ),
                _MenuItem(
                  icon: Icons.person,
                  title: "Profile",
                ),
                _MenuItem(
                  icon: Icons.analytics,
                  title: "Analytics",
                ),
                _MenuItem(
                  icon: Icons.notifications,
                  title: "Notifications",
                ),
                _MenuItem(
                  icon: Icons.settings,
                  title: "Settings",
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: _UserTile(),
          ),
        ],
      ),
    );
  }
}

Widget _header() {
  return Column(
    children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.flutter_dash, size: 30),
      ),
      const SizedBox(height: 10),
      const Text(
        "My App",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )
    ],
  );
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool active;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: active ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: active ? AppColors.primary : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: active ? AppColors.primary : Colors.black,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aadi Verma",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        const Icon(Icons.logout, size: 18)
      ],
    );
  }
}