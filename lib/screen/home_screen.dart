import 'package:easy_learn/screen/ask_ai_screen.dart';
import 'package:easy_learn/screen/bookmark_screen.dart';
import 'package:easy_learn/screen/drawer_screen.dart';
import 'package:easy_learn/screen/forum_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse('https://easy-learning-platform.netlify.app/'));
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text("Easy Learning",
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ))),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded),
              color: Colors.teal,
            )
          ],
          elevation: .5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          bottom: TabBar(
            indicatorColor: Colors.teal,
            indicatorWeight: 4,
            tabs: [
              Tab(
                icon: Icon(Icons.home_rounded),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.bookmark_rounded),
                text: "Dashboard",
              ),
              Tab(
                icon: Icon(Icons.forum_rounded),
                text: "Forum",
              ),
              Tab(
                icon: Icon(Icons.cloud_queue_rounded),
                text: "Ask AI",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WebViewWidget(controller: controller),
            DashBoardScreen(),
            ForumScreen(),
            ChatbotPage(),
          ],
        ),
        drawer: DrawerScreen(),
      ),
    );
  }
}
