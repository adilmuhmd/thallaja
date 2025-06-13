import 'package:flutter/material.dart';

class _FullScreenSearchBar extends StatelessWidget {
  const _FullScreenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search services, rentals, or products',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close, size: 28, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Recent Searches',
              style: TextStyle(fontSize: 45,
                  color: Color(0xFF717171),
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w400,),
            ),
            SizedBox(height: 12),
            Text('• AC Maintenance'),
            Text('• Spare Parts'),
            Text('• Cold Storage Projects'),
            SizedBox(height: 24),
            Text(
              'Popular Services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('• Rentals'),
            Text('• AMC 25% OFF'),
            Text('• Duct Cleaning'),
          ],
        ),
      ),
    );
  }
}
