import 'package:flutter/material.dart';
import 'package:sign_app/Widgets/home_app_bar.dart';
import 'package:sign_app/Widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final String userName = 'زياد علاء';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(userName: userName),
                const SizedBox(height: 80),
                const HomeBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//Container(
//   decoration: BoxDecoration(
//     color: kPrimaryColor,
//     borderRadius: BorderRadius.circular(16),
//   ),
//   child: const Padding(
//     padding: EdgeInsets.all(12),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'مرحباٌ بك في تطبيق التعليم ',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         Text(
//           'استكشف المحتوي التعليمي وترجم النصوص والفيديوهات ',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 16,
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
