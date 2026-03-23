import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';
import '../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: Responsive.isMobile(context)
          ? AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      )
          : null,
      drawer: Responsive.isMobile(context) ? _drawer(context) : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (Responsive.isMobile(context)) return const _MobileLayout();
          if (Responsive.isTablet(context)) return const _TabletLayout();
          return const _DesktopLayout();
        },
      ),
    );
  }
}

Widget _drawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: AppColors.card(context),
      child: ListView(
        children: const [
          DrawerHeader(child: Text("Dashboard Menu")),
          ListTile(leading: Icon(Icons.home), title: Text("Home")),
          ListTile(leading: Icon(Icons.bar_chart), title: Text("Analytics")),
          ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
        ],
      ),
    ),
  );
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _header(context),
        const SizedBox(height: 16),
        _searchBar(context),
        const SizedBox(height: 20),
        _statsRow(context),
        const SizedBox(height: 20),
        _chartCard(),
        const SizedBox(height: 20),
        _cardList(context),
      ],
    );
  }
}

class _TabletLayout extends StatelessWidget {
  const _TabletLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _sidebar(context),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              _header(context),
              const SizedBox(height: 20),
              _searchBar(context),
              const SizedBox(height: 20),
              _statsGrid(context, 2),
              const SizedBox(height: 20),
              _chartCard(),
              const SizedBox(height: 20),
              _gridCards(context, 2),
            ],
          ),
        )
      ],
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _sidebar(context),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(32),
            children: [
              _header(context),
              const SizedBox(height: 24),
              _searchBar(context),
              const SizedBox(height: 24),
              _statsGrid(context, 4),
              const SizedBox(height: 24),
              _chartCard(),
              const SizedBox(height: 24),
              _gridCards(context, 4),
            ],
          ),
        )
      ],
    );
  }
}

Widget _header(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome Back",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Dashboard Overview", style: TextStyle(color: Colors.grey)),
        ],
      ),
      Row(
        children: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications)),
          const CircleAvatar(
            child: Icon(Icons.person),
          )
        ],
      )
    ],
  );
}

Widget _searchBar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: AppColors.card(context),
      borderRadius: BorderRadius.circular(16),
    ),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Search...",
        border: InputBorder.none,
        icon: Icon(Icons.search),
      ),
    ),
  );
}

Widget _statsRow(BuildContext context) {
  return Row(
    children: const [
      Expanded(child: _StatCard(title: "Users", value: "1200")),
      SizedBox(width: 12),
      Expanded(child: _StatCard(title: "Sales", value: "₹12K")),
    ],
  );
}

Widget _statsGrid(BuildContext context, int count) {
  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: count,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    children: const [
      _StatCard(title: "Users", value: "1200"),
      _StatCard(title: "Revenue", value: "₹32K"),
      _StatCard(title: "Orders", value: "320"),
      _StatCard(title: "Growth", value: "12%"),
    ],
  );
}

Widget _chartCard() {
  return Container(
    height: 200,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.deepPurple, Colors.purpleAccent],
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Center(
      child: Text(
        "Analytics Chart",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

Widget _cardList(BuildContext context) {
  return Column(
    children: List.generate(5, (index) => const _MainCard()),
  );
}

Widget _gridCards(BuildContext context, int count) {
  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: count,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    children: List.generate(8, (index) => const _MainCard()),
  );
}

Widget _sidebar(BuildContext context) {
  return Container(
    width: 240,
    color: AppColors.card(context),
    child: Column(
      children: const [
        SizedBox(height: 40),
        Text("Dashboard", style: TextStyle(fontSize: 20)),
        ListTile(leading: Icon(Icons.home), title: Text("Home")),
        ListTile(leading: Icon(Icons.bar_chart), title: Text("Analytics")),
        ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
      ],
    ),
  );
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _MainCard extends StatefulWidget {
  const _MainCard();

  @override
  State<_MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<_MainCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card(context),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              blurRadius: hover ? 20 : 10,
              color: Colors.black.withOpacity(0.08),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.analytics),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Analytics Report",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Detailed insights and metrics"),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16)
          ],
        ),
      ),
    );
  }
}