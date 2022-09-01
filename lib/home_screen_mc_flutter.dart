import 'package:flutter/material.dart';

enum SelectedButton { person, timer, android, iphone }

class HomeScreenMcFlutter extends StatefulWidget {
  const HomeScreenMcFlutter({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenMcFlutter> createState() => _HomeScreenMcFlutterState();
}

class _HomeScreenMcFlutterState extends State<HomeScreenMcFlutter> {
  SelectedButton? selectedButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mc Flutter'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 41, 41, 41))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle_rounded,
                  size: 46,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      style: TextStyle(fontSize: 24),
                      'Flutter McFlutter',
                    ),
                    Text(
                      'Experienced App Developer',
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 4,
                top: 12,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('123 Main Street'),
                  Text('(415) 555-0198')
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getIconButton(context,
                    icon: Icons.accessibility,
                    snackBarText: 'Únete a un club con otras personas',
                    buttonValue: SelectedButton.person),
                getIconButton(context,
                    icon: Icons.timer,
                    snackBarText: 'Cuenta regresiva para el evento: 31 días',
                    buttonValue: SelectedButton.timer),
                getIconButton(context,
                    icon: Icons.phone_android,
                    snackBarText: 'Llama al número 4155550198',
                    buttonValue: SelectedButton.android),
                getIconButton(context,
                    icon: Icons.phone_iphone_outlined,
                    snackBarText: 'Llama al celular 3317865113',
                    buttonValue: SelectedButton.iphone),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconButton getIconButton(BuildContext context,
      {required IconData icon,
      required String snackBarText,
      required SelectedButton buttonValue}) {
    return IconButton(
        onPressed: () {
          setState(() {
            if (selectedButton == buttonValue) {
              selectedButton = null;
            } else {
              selectedButton = buttonValue;
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(snackBarText)));
            }
          });
        },
        icon: Icon(icon),
        color: selectedButton == buttonValue ? Colors.indigo : Colors.black);
  }
}
