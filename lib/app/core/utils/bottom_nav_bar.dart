import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatefulWidget {
  final StatefulNavigationShell child;
  const BottomNavBar({super.key, required this.child});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.child,

      bottomNavigationBar: BottomNavigationBar(
        elevation: 15.sp,
        currentIndex: widget.child.currentIndex,
        onTap: (index) => widget.child.goBranch(index, initialLocation: true),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Buy and Sell"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Airtime"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
