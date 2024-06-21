import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safarny/widgets/drawer_wid.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        drawer: Menu(),
        controller: _advancedDrawerController,
        child: Scaffold());
  }
}
