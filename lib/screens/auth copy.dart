import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:safarny/screens/startScreen.dart';
import '../../utils/animations.dart';

import '../../data/bg_data.dart';
import '../helpers/app_regex.dart';
import '../helpers/rive_controller.dart';
import '../utils/text_utils.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AuthScreenState();
  }
}

void startScreen(BuildContext ctx) {
  Navigator.of(ctx).push(
    MaterialPageRoute(
      builder: (_) {
        return StartScreen();
      },
    ),
  );
}

class _AuthScreenState extends State<AuthScreen> {
  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasMinLength = AppRegex.isPasswordValid(passwordController.text);
      });
    });
  }

  int selectedIndex = 0;
  bool showOption = false;
  bool isLogin = true;
  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;
  SMIInput<int>? numLook;
  StateMachineController? stateMachineController;
  final TextEditingController _emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RiveAnimationControllerHelper riveHelper =
      RiveAnimationControllerHelper();
  final passwordFocuseNode = FocusNode();
  final passwordConfirmationFocuseNode = FocusNode();

  void checkForPasswordConfirmationFocused() {
    passwordConfirmationFocuseNode.addListener(() {
      if (passwordConfirmationFocuseNode.hasFocus && isObscureText) {
        riveHelper.addHandsUpController();
      } else if (!passwordConfirmationFocuseNode.hasFocus && isObscureText) {
        riveHelper.addHandsDownController();
      }
    });
  }

  void checkForPasswordFocused() {
    passwordFocuseNode.addListener(() {
      if (passwordFocuseNode.hasFocus && isObscureText) {
        riveHelper.addHandsUpController();
      } else if (!passwordFocuseNode.hasFocus && isObscureText) {
        riveHelper.addHandsDownController();
      }
    });
  }

  bool isObscureText = true;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    _initRiveAnimation();
    setupPasswordControllerListener();
    checkForPasswordFocused();
    checkForPasswordConfirmationFocused();
  }

  Future<void> _initRiveAnimation() async {
    final bytes = await rootBundle.load('../assets/headless_bear.riv');
    final file = RiveFile.import(bytes);
    final Artboard? artboard = file.mainArtboard;
    stateMachineController =
        StateMachineController.fromArtboard(artboard!, 'State Machine Name');
    if (stateMachineController != null) {
      artboard.addController(stateMachineController!);
      isChecking = stateMachineController?.findInput('isChecking');
      isHandsUp = stateMachineController?.findInput('isHandsUp');
      trigSuccess = stateMachineController?.findInput('trigSuccess');
      trigFail = stateMachineController?.findInput('trigFail');
      numLook = stateMachineController?.findInput('numLook');
    }
    setState(() {}); // Refresh UI after loading the animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 49,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                child: showOption
                    ? ShowUpAnimation(
                        delay: 100,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: bgList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                        bgList[index],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : const SizedBox()),
            const SizedBox(
              width: 20,
            ),
            showOption
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        showOption = false;
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ))
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        showOption = true;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            bgList[selectedIndex],
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgList[selectedIndex]), fit: BoxFit.fill),
        ),
        alignment: Alignment.center,
        child: isLogin
            ? Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Container(
                              height: MediaQuery.of(context).size.height / 5,
                              child: stateMachineController == null
                                  ? Container()
                                  : Rive(
                                      fit: BoxFit.cover,
                                      artboard:
                                          stateMachineController!.artboard!,
                                    )),
                          Center(
                              child: TextUtil(
                            text: "Login",
                            weight: true,
                            size: 30,
                          )),
                          const Spacer(),
                          TextUtil(
                            text: "Email",
                          ),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.isNotEmpty &&
                                    value.length <= 13 &&
                                    !riveHelper.isLookingLeft) {
                                  riveHelper.addDownLeftController();
                                } else if (value.isNotEmpty &&
                                    value.length > 13 &&
                                    !riveHelper.isLookingRight) {
                                  riveHelper.addDownRightController();
                                } else if (value.isEmpty) {
                                  riveHelper.addDownLeftController();
                                }
                              },
                              controller: _emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),
                          TextUtil(
                            text: "Password",
                          ),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: TextUtil(
                                text: "Remember Me , FORGET PASSWORD",
                                size: 12,
                                weight: true,
                              ))
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (isChecking != null &&
                                      isHandsUp != null &&
                                      trigFail != null &&
                                      trigSuccess != null) {
                                    isChecking!.change(false);
                                    isHandsUp!.change(false);
                                    trigFail!.change(false);
                                    trigSuccess!.change(true);
                                  }
                                },
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                )),
                          ),
                          const Spacer(),
                          Center(
                              child: Row(
                            children: [
                              TextUtil(
                                text: "Don't have an account",
                                size: 12,
                                weight: true,
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isLogin = false;
                                    });
                                  },
                                  child: Text(
                                    "REGISTER",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          )),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Container(
                                height: MediaQuery.of(context).size.height / 5,
                                child: stateMachineController == null
                                    ? Container()
                                    : Rive(
                                        fit: BoxFit.cover,
                                        artboard:
                                            stateMachineController!.artboard!,
                                      ),
                              ),
                              Center(
                                  child: TextUtil(
                                text: "Sign Up",
                                weight: true,
                                size: 30,
                              )),
                              const Spacer(),
                              TextUtil(
                                text: "Email",
                              ),
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.white))),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.white,
                                    ),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              TextUtil(
                                text: "Username",
                              ),
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.white))),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  keyboardType: TextInputType
                                      .name, // Set input type to accept numbers
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons
                                          .person, // You can change the icon to something more relevant like a person icon
                                      color: Colors.white,
                                    ),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              TextUtil(
                                text: "Password",
                              ),
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.white))),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              TextUtil(
                                text: "Confirm Password",
                              ),
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.white))),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                alignment: Alignment.center,
                                child: TextUtil(
                                  text: "Signup",
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(),
                              Center(
                                  child: Row(
                                children: [
                                  TextUtil(
                                    text: "Already have an account",
                                    size: 12,
                                    weight: true,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isLogin = true;
                                        });
                                      },
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              )),
                              const Spacer(),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
      ),
    );
  }
}
