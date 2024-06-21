import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:safarny/screens/homepage.dart';

import '../../utils/animations.dart';

import '../../data/bg_data.dart';
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
        return HomePage();
      },
    ),
  );
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedIndex = 0;
  bool showOption = false;
  bool isLogin = true;
  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMITrigger? trigSuccess;
  SMITrigger? trigFail;
  SMINumber? numLook;
  late StateMachineController? stateMachineController;
  final TextEditingController _emailController = TextEditingController();
  checking() {
    isHandsUp!.change(false);
    isChecking!.change(true);
    numLook!.change(0);
  }

  handsUp() {
    isHandsUp!.change(true);
    isChecking!.change(false);
  }

  moveEyes(value) {
    numLook!.change(value.length.toDouble());
  }

  login() {
    isHandsUp!.change(false);
    isChecking!.change(false);
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
                            child: RiveAnimation.asset(
                              "assets/headless_bear.riv",
                              stateMachines: ['Login Machine'],
                              onInit: (artboard) {
                                stateMachineController =
                                    StateMachineController.fromArtboard(
                                        artboard, 'Login Machine');
                                if (stateMachineController == null) return;
                                artboard.addController(stateMachineController!);
                                isChecking = stateMachineController
                                    ?.findInput('isChecking');
                                isHandsUp = stateMachineController
                                    ?.findInput('isHandsUp');
                                trigSuccess = stateMachineController
                                    ?.findSMI('trigSuccess');
                                trigFail =
                                    stateMachineController?.findSMI('trigFail');
                                numLook =
                                    stateMachineController?.findSMI('numLook');
                              },
                            ),
                          ),
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
                              onTap: () {
                                if (isHandsUp != null) {
                                  isHandsUp!.change(false);
                                }
                                if (isChecking == null) return;

                                isChecking!.change(true);

                                if ((isChecking != null)) {}
                              },
                              onChanged: (value) {
                                numLook!.change(value.length.toDouble());
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
                              onTap: () {
                                if ((isChecking != null)) {
                                  isChecking!.change(false);
                                }
                                if (isHandsUp == null) return;

                                isHandsUp!.change(true);
                                if (isHandsUp != null) {}
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (isHandsUp != null) {
                                      isHandsUp!.change(!isHandsUp!.value);
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                  ),
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
                                  if (isHandsUp != null) {
                                    isHandsUp!.change(false);
                                  }
                                  if (isChecking != null) {
                                    isChecking!.change(false);
                                  }
                                  if (isChecking == null) return;
                                  if (isHandsUp == null) return;
                                  Future.delayed(Duration(milliseconds: 2000),
                                      () {
                                    trigSuccess!.fire();
                                  });
                                  Future.delayed(Duration(milliseconds: 3000),
                                      () {
                                    startScreen(context);
                                  });
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
                                child: RiveAnimation.asset(
                                    "assets/headless_bear.riv"),
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
