import 'package:flutter/material.dart';
import 'package:newptoject/controller/fetchMeme.dart';
import 'package:newptoject/view/mainScreen.dart';
import 'package:page_flip/page_flip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = GlobalKey<PageFlipWidgetState>();
  List<String> memeUrls = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async {
    memeUrls = await FetchMeme.fetchMemes(); // Fetch all 10 memes at once
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : PageFlipWidget(
        key: _controller,
        backgroundColor: Colors.yellow,
        initialIndex: 0,
        lastPage: Container(
          color: Colors.white,
          child: const Center(child: Text('Last Page!')),
        ),
        children: [
          for (var i = 0; i < memeUrls.length; i++)
            MainScreen(page: i, imageUrl: memeUrls[i]),
        ],
      ),
    );
  }
}
