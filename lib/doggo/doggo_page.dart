import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class DoggoPage extends StatefulWidget {
  const DoggoPage({Key? key}) : super(key: key);

  @override
  State<DoggoPage> createState() => _DoggoPageState();
}

class _DoggoPageState extends State<DoggoPage> {
  Artboard? _riveArtBoard;
  StateMachineController? _stateMachineController;
  SMIInput<bool>? input;
  FocusNode focusNode = FocusNode();

  Future<void> initArtBoard() async {
    final data = await rootBundle.load('assets/rive/doggo.riv');
    final file = RiveFile.import(data);
    final artBoard = file.mainArtboard;
    _stateMachineController =
        StateMachineController.fromArtboard(artBoard, 'State Machine 1');
    if (_stateMachineController != null) {
      artBoard.addController(_stateMachineController!);
      input = _stateMachineController!.findInput<bool>('searchHover');
      input!.value = false;
      setState(() {
        _riveArtBoard = artBoard;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initArtBoard();

    focusNode.addListener(() {
      input!.value = focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: GestureDetector(
        onTap: () {
          input!.value = !input!.value;
        },
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 124,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      focusNode: focusNode,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Type me',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                  ),
                ),
                if (_riveArtBoard != null)
                  Positioned(
                      right: 0,
                      top: 0,
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Rive(artboard: _riveArtBoard!)))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
