import 'package:flutter/material.dart';

class HotspotVue extends StatefulWidget {
  String? titre;
  HotspotVue({this.titre: ""});

  @override
  State<StatefulWidget> createState() {
    return _HotspotVue();
  }
}

class _HotspotVue extends State<HotspotVue> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    //
    controller = AnimationController(vsync: this);

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  //
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      child: Column(
        children: [
          HotspotAnimation(
            icon: Container(
              height: 32,
              width: 32,
            ),
            animation: controller,
          ),
          Text(
            widget.titre!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 10),
          )
        ],
      ),
    );
  }
}

class HotspotAnimation extends AnimatedWidget {
  Widget? icon;
  HotspotAnimation({super.key, this.icon, required Animation<double> animation})
      : super(listenable: animation);

  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 15, end: 32);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        //1, //
        opacity: 1, //_opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(_sizeTween.evaluate(animation)),
          ),
          child: icon,
        ),
      ),
    );
  }
}
