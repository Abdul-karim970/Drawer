import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Drawer', size: size),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.size});

  final String title;
  final Size size;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final double width;
  late final double height;
  late AnimationController _animationController;
  late Animation<double> _iconAnimation;
  late Animation<double> _dropAnimation;
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _slideRightAnimation;
  late Animation<Color?> _droppingShadowsColorAnimation;
  late Animation<double> _radiusAnimation;
  late Animation<double> _itemsFadeAnimation;

  double itemsSpace = 10;

  @override
  void initState() {
    super.initState();
    width = widget.size.width;
    height = widget.size.height;

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    _iconAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.1)));
    _dropAnimation = Tween<double>(begin: -0.9, end: 0.75).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.15, 0.4, curve: Curves.bounceOut)));

    _droppingShadowsColorAnimation =
        ColorTween(begin: Colors.transparent, end: Colors.black38)
            .animate(CurvedAnimation(
                parent: _animationController,
                curve: const Interval(
                  0.15,
                  0.4,
                )));

    _heightAnimation = Tween<double>(begin: height * 0.07, end: height * 0.75)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.5, 0.6, curve: Curves.linear)));
    _widthAnimation = Tween<double>(begin: width * 0.15, end: width * 0.8)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.7, 1, curve: Curves.elasticOut)));
    _radiusAnimation = Tween<double>(begin: 60, end: 20).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.7, 1, curve: Curves.bounceOut)));
    _slideRightAnimation = Tween<double>(begin: -0.9, end: -0.55).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.7, 1, curve: Curves.elasticOut)));
    _itemsFadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(
              0.7,
              1,
            )));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Align(
              alignment:
                  Alignment(_slideRightAnimation.value, _dropAnimation.value),
              child: Container(
                width: _widthAnimation.value,
                height: _heightAnimation.value,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: _droppingShadowsColorAnimation.value!,
                        blurRadius: 5,
                        offset: const Offset(2, 2),
                      )
                    ]),
                child: Opacity(
                  opacity: _itemsFadeAnimation.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_max_outlined,
                            color: Colors.blueGrey.shade600,
                            size: 30,
                          ),
                          SizedBox(
                            width: itemsSpace,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: width * 0.05,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outline_outlined,
                            color: Colors.blueGrey.shade600,
                            size: 30,
                          ),
                          SizedBox(
                            width: itemsSpace,
                          ),
                          Text(
                            'Your Profile',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: width * 0.05,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medical_information_outlined,
                            color: Colors.blueGrey.shade600,
                            size: 30,
                          ),
                          SizedBox(
                            width: itemsSpace,
                          ),
                          Text(
                            'Installment Info',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: width * 0.05,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.groups_2_outlined,
                            color: Colors.blueGrey.shade600,
                            size: 30,
                          ),
                          SizedBox(
                            width: itemsSpace,
                          ),
                          Text(
                            'Your Group',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: width * 0.05,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.groups_2_outlined,
                            color: Colors.blueGrey.shade600,
                            size: 30,
                          ),
                          SizedBox(
                            width: itemsSpace,
                          ),
                          Text(
                            'All Groups',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: width * 0.05,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.business_rounded,
                            color: Colors.blueGrey.shade600,
                          ),
                          SizedBox(
                            width: itemsSpace,
                          ),
                          Text(
                            'About',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: width * 0.05,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.9, -0.9),
              child: GestureDetector(
                onTap: () {
                  if (_animationController.status ==
                      AnimationStatus.completed) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.15,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: AnimatedIcon(
                      color: Colors.blueGrey.shade50,
                      icon: AnimatedIcons.list_view,
                      progress: _iconAnimation),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
