import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
return Container(
  width: 250,
  color: Colors.white,
  child: SafeArea(
    child: Column(
      children: [
        // Logo and title
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 12, bottom: 8),
          child: Row(
            children: const [
              CircleAvatar(
                backgroundColor: Color(0xFF2A99E3),
                child: Icon(Icons.add, color: Colors.white),
              ),
              SizedBox(width: 10),
              Text(
                'Goodman',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2A99E3),
                ),
              ),
            ],
          ),
        ),

        // Search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search, size: 18),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),

        // Scrollable navigation
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: const [
              _SidebarItem(icon: Icons.grid_view, label: 'Dashboard'),
              _SidebarItem(icon: Icons.supervised_user_circle, label: 'Management'),
              _SidebarItem(icon: Icons.attach_money, label: 'Sales'),
              _SidebarItem(icon: Icons.inventory_2, label: 'Product'),
              _SidebarItem(icon: Icons.receipt, label: 'Expense'),
              _SidebarItem(icon: Icons.place, label: 'Location'),
              _SidebarItem(icon: Icons.local_pharmacy, label: 'Chemist'),
              _SidebarItem(icon: Icons.local_hospital, label: 'Doctor & Institute'),
              _SidebarItem(icon: Icons.insert_drive_file, label: 'DMS'),
              _SidebarItem(icon: Icons.show_chart, label: 'KPI'),
            ],
          ),
        ),

        // Footer
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            '© ENOVATION LIMITED\nAll Rights Reserved.',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ),
      ],
    ),
  ),
);

  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SidebarItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: Icon(icon, size: 20, color: Colors.grey[800]),
      title: Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      onTap: () {},
    );
  }
}

