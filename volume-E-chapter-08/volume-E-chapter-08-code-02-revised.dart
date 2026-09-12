// 이 파일은 앱을 시작하고 세 페이지를 연결하는 역할만 한다.
//
// 구조를 개선하며 바꾼 점:
// 1. 기존 MyStatefulWidget을 MainPage로 이름을 바꾸었다.
// 2. 기존 HomeWidget, HelloWidget, StarWidget을 각각 별도 파일의 페이지로 분리했다.
// 3. 페이지 안의 중복 Scaffold를 제거하고 이 파일의 Scaffold 하나만 사용한다.
// 4. Star 화면의 Map 자료를 이름이 있는 _StarContent 객체로 바꾸었다.
// 5. 전역 화면 함수들을 각 화면을 담당하는 클래스의 메서드로 옮겼다.
// 6. 화면별 작은 UI를 별도 위젯으로 나누어 역할이 보이게 했다.
//
// 원래 프로그램의 화면 내용과 하단 메뉴 동작은 그대로 유지한다.

import 'package:flutter/material.dart';

// Flutter 앱을 시작하는 함수이다.
void main() {
  runApp(const MyApp());
}

// 앱 전체의 기본 설정을 담당한다.
class MyApp extends StatelessWidget {
  // 앱 이름을 한 곳에서 관리한다.
  static const String _title = 'Flutter SketchApp';

  // MyApp은 상태를 사용하지 않으므로 const 생성자를 사용한다.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp은 Material 디자인 기반 앱을 만든다.
    return const MaterialApp(title: _title, home: MainPage());
  }
}

// 세 페이지 사이의 이동과 공통 화면 틀을 담당한다.
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // PageView가 현재 페이지를 바꾸도록 조작하는 컨트롤러이다.
  final PageController _pageController = PageController();

  // 하단 메뉴에서 현재 선택된 항목의 번호이다.
  int _selectedIndex = 0;

  // 하단 메뉴 순서와 PageView의 페이지 순서를 일치시킨다.
  static const List<Widget> _pages = [HomePage(), HelloPage(), StarPage()];

  @override
  void dispose() {
    // 화면이 사라질 때 PageController가 사용한 자원을 정리한다.
    _pageController.dispose();
    super.dispose();
  }

  // 하단 메뉴를 누르면 해당 페이지로 이동한다.
  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // PageView를 손가락으로 넘겼을 때 하단 메뉴도 갱신한다.
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 앱 전체에서 사용하는 Scaffold는 여기 하나만 만든다.
    return Scaffold(
      // 모든 페이지 위쪽에 같은 앱 바를 표시한다.
      appBar: AppBar(title: const Text('Flutter Sketch Application')),
      // PageView가 세 화면 중 현재 화면을 보여 준다.
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      // 하단 메뉴로 세 페이지 사이를 이동할 수 있게 한다.
      bottomNavigationBar: BottomNavigationBar(
        // 각 메뉴의 아이콘과 이름을 지정한다.
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wb_cloudy), label: 'Hello'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Star'),
        ],
        // 현재 페이지에 해당하는 메뉴를 선택 상태로 표시한다.
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        // 메뉴를 누르면 PageView도 같은 페이지로 이동시킨다.
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
 * 참고 자료
 *
 * https://api.flutter.dev/flutter/widgets/PageController-class.html
 * https://api.flutter.dev/flutter/widgets/PageView-class.html
 * https://api.flutter.dev/flutter/material/BottomNavigationBarItem-class.html
 * https://api.flutter.dev/flutter/material/TextButton-class.html
 * https://api.flutter.dev/flutter/material/AlertDialog-class.html
 * https://api.flutter.dev/flutter/material/showDialog.html
 */

// ================================================================
// Home 화면
// ================================================================

// Home 화면을 보여 주는 위젯이다.
class HomePage extends StatelessWidget {
  // 화면에 표시할 이미지 주소를 한 곳에서 관리한다.
  static const String _imageUrl =
      'https://flutter.dev/assets/flutter-on-mobile.825104937d6f90daae08ce20d9c7c350.png';

  // HomePage는 상태를 사용하지 않으므로 const 생성자를 사용한다.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 페이지 자체는 내용만 반환하고 Scaffold는 만들지 않는다.
    return SingleChildScrollView(
      // 내용이 작은 화면을 넘어가도 스크롤할 수 있게 한다.
      child: Padding(
        // 화면 가장자리에 여백을 준다.
        padding: const EdgeInsets.all(20),
        child: Column(
          // 화면 위젯을 세로로 배치한다.
          children: [
            // 가게 이름을 화면 위쪽에 표시한다.
            const Text(
              'Shop Name',
              style: TextStyle(fontSize: 32, color: Colors.black87),
            ),
            // 네트워크에서 이미지를 불러온다.
            Image.network(_imageUrl, width: 300, height: 300),
            // 별점과 리뷰 수를 한 줄에 표시한다.
            const _ReviewSummary(),
            // 가게의 주요 정보를 아이콘과 함께 표시한다.
            const _ShopFeatures(),
          ],
        ),
      ),
    );
  }
}

// 별점과 리뷰 수를 표시하는 작은 위젯이다.
class _ReviewSummary extends StatelessWidget {
  const _ReviewSummary();

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 별점 영역 위아래에 여백을 준다.
      padding: const EdgeInsets.all(20),
      child: Row(
        // 별점과 리뷰 수를 가로 방향으로 배치한다.
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 별 세 개를 하나의 Row로 묶는다.
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star, color: Colors.green[500]),
              const Icon(Icons.star, color: Colors.black),
            ],
          ),
          // 리뷰 개수를 텍스트로 표시한다.
          const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

// 주방, 시간, 식당 정보를 표시하는 위젯이다.
class _ShopFeatures extends StatelessWidget {
  const _ShopFeatures();

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 정보 목록 주위에 여백을 준다.
      padding: const EdgeInsets.all(20),
      child: Row(
        // 세 항목 사이의 간격을 일정하게 만든다.
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _FeatureItem(icon: Icons.kitchen, label: 'kitchen:'),
          _FeatureItem(icon: Icons.timer, label: 'timer:'),
          _FeatureItem(icon: Icons.restaurant, label: 'restaurant:'),
        ],
      ),
    );
  }
}

// 아이콘과 설명을 함께 표시하는 재사용 위젯이다.
class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      // 아이콘과 문자를 세로로 배치한다.
      mainAxisSize: MainAxisSize.min,
      children: [
        // 항목의 종류를 아이콘으로 표시한다.
        Icon(icon, color: Colors.green),
        // 항목의 이름을 표시한다.
        Text(label),
      ],
    );
  }
}

// ================================================================
// Hello 화면
// ================================================================

// Hello 화면과 다이얼로그를 담당하는 위젯이다.
class HelloPage extends StatelessWidget {
  // HelloPage는 상태를 사용하지 않으므로 const 생성자를 사용한다.
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 페이지의 중앙에 버튼 하나를 배치한다.
    return Center(
      child: TextButton(
        // 버튼 글자의 색과 크기를 지정한다.
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 32),
        ),
        // 버튼을 누르면 다이얼로그를 표시한다.
        onPressed: () => _showAlertDialog(context),
        // 버튼에 표시할 문자를 지정한다.
        child: const Text('Hello, Press Here!'),
      ),
    );
  }

  // 확인 또는 취소를 선택할 수 있는 다이얼로그를 표시한다.
  Future<void> _showAlertDialog(BuildContext context) async {
    // showDialog가 반환하는 선택 결과를 문자열로 받는다.
    final result = await showDialog<String>(
      context: context,
      // 바깥 영역을 눌러서는 다이얼로그를 닫지 못하게 한다.
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        // 다이얼로그의 제목, 내용, 버튼을 구성한다.
        return AlertDialog(
          title: const Text('AlertDialog Sample'),
          content: const Text('Select button you want'),
          actions: [
            // OK를 누르면 OK라는 값을 반환한다.
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, 'OK'),
              child: const Text('OK'),
            ),
            // Cancel을 누르면 Cancel이라는 값을 반환한다.
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, 'Cancel'),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );

    // 다이얼로그가 닫혔지만 결과가 없으면 아무 작업도 하지 않는다.
    if (result == null) return;

    // 선택 결과를 디버그 콘솔에 출력한다.
    debugPrint('_showAlertDialog(): $result');
  }
}

// ================================================================
// Star 화면
// ================================================================

// Star 화면에서 사용할 내용을 이름이 있는 필드로 관리한다.
class _StarContent {
  final String imageUrl;
  final String title;
  final String link;
  final String description;

  const _StarContent({
    required this.imageUrl,
    required this.title,
    required this.link,
    required this.description,
  });
}

// Star 화면과 별표 버튼의 상태를 담당하는 위젯이다.
class StarPage extends StatelessWidget {
  // Map 대신 자료의 의미가 드러나는 객체를 사용한다.
  static const _content = _StarContent(
    imageUrl: 'https://flutter.dev/assets/flutter-on-mobile.825104937d6f90daae08ce20d9c7c350.png',
    title: 'Flutter on Mobile',
    link: 'https://flutter.dev/multi-platform/mobile',
    description:
        'Bring your app idea to more users from day one by building with Flutter '
        'on iOS and Android simultaneously, without sacrificing features, '
        'quality, or performance. All mobile on day one: Reach your full '
        'addressable market from day one by targeting users in both ecosystems '
        'from a single codebase. Do more with less: Unite your mobile '
        'development team resources towards building one seamless customer '
        'experience. One experience: Release simultaneously on iOS and Android '
        'with feature parity for the best experience for all users.',
  );

  // StarPage는 자체 상태가 없으므로 const 생성자를 사용한다.
  const StarPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면을 위에서 아래로 읽을 수 있도록 내용을 순서대로 배치한다.
    return ListView(
      children: [
        // 화면 상단의 이미지를 표시한다.
        Image.network(_content.imageUrl, height: 240, fit: BoxFit.cover),
        // 제목, 링크, 별표 버튼을 표시한다.
        _buildTitleSection(),
        // 화면에서 제공하는 세 가지 동작을 표시한다.
        _buildButtonSection(Theme.of(context).primaryColor),
        // 설명 문장을 표시한다.
        _buildTextSection(),
      ],
    );
  }

  // 제목과 링크, 별표 개수를 한 줄에 표시한다.
  Widget _buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          // 제목 영역이 남은 공간을 사용하도록 한다.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 콘텐츠 제목을 굵게 표시한다.
                Text(
                  _content.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                // 콘텐츠 링크를 회색으로 표시한다.
                Text(_content.link, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          // 별표 버튼과 현재 개수를 표시한다.
          const FavoriteCounter(),
        ],
      ),
    );
  }

  // 아이콘 세 개와 각 아이콘의 이름을 가로로 표시한다.
  Widget _buildButtonSection(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ActionItem(
          color: color,
          icon: Icons.assistant_navigation,
          label: 'Visit',
        ),
        _ActionItem(color: color, icon: Icons.add_alert_sharp, label: 'Alarm'),
        _ActionItem(color: color, icon: Icons.share, label: 'Share'),
      ],
    );
  }

  // Star 화면의 설명 문단을 표시한다.
  Widget _buildTextSection() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        _content.description,
        softWrap: true,
        textAlign: TextAlign.justify,
        style: const TextStyle(height: 1.5, fontSize: 15),
      ),
    );
  }
}

// 아이콘과 이름을 함께 표시하는 작은 위젯이다.
class _ActionItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const _ActionItem({
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 동작의 종류를 아이콘으로 보여 준다.
        Icon(icon, color: color),
        // 아이콘 아래에 동작 이름을 보여 준다.
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(label, style: TextStyle(fontSize: 13, color: color)),
        ),
      ],
    );
  }
}

// 별표를 누른 상태와 별표 개수를 관리하는 위젯이다.
class FavoriteCounter extends StatefulWidget {
  const FavoriteCounter({super.key});

  @override
  State<FavoriteCounter> createState() => _FavoriteCounterState();
}

class _FavoriteCounterState extends State<FavoriteCounter> {
  // 현재 별표 개수를 저장한다.
  int _count = 0;
  // 현재 별표가 선택되었는지 저장한다.
  bool _isSelected = false;

  // 별표를 누를 때 선택 상태와 개수를 함께 바꾼다.
  void _toggleFavorite() {
    setState(() {
      _isSelected = !_isSelected;
      _count += _isSelected ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 선택 상태에 따라 별표 색상을 바꾼다.
        IconButton(
          icon: const Icon(Icons.star),
          color: _isSelected ? Colors.red : Colors.black,
          onPressed: _toggleFavorite,
        ),
        // 현재 별표 개수를 표시한다.
        Text('$_count'),
      ],
    );
  }
}
