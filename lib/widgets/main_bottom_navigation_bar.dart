import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../helper/app_router.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const MainBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          // case 0:
          //   context.go(AppRouter.kHomeScreen);
          //   break;
          // case 1:
          //   context.go(AppRouter.kAlphaScreen);
          //   break;
          // case 2:
          //   context.go(AppRouter.kNumberScreen);
          //   break;
          case 3:
            context.go(AppRouter.kLearningContentScreen);
            break;
          // case 4:
          //   context.go(AppRouter.kProfileScreen);
          //   break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.videocam, size: 32),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_fields, size: 32),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 32),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description, size: 32),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 32),
          label: "",
        ),
      ],
    );
  }
}
