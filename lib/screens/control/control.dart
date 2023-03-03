import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:graduationupdate/colors/app_colors.dart';


const ballSize = 20.0;
const step = 10.0;

class JoystickExample extends StatefulWidget {
  const JoystickExample({Key? key}) : super(key: key);

  @override
  _JoystickExampleState createState() => _JoystickExampleState();
}

class _JoystickExampleState extends State<JoystickExample> {
  double _x = 100;
  double _y = 100;
  JoystickMode _joystickMode = JoystickMode.all;

  @override
  void didChangeDependencies() {
    _x = MediaQuery.of(context).size.width / 2 - ballSize / 2;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: SafeArea(
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 300,
                  child: Center(
                    child: Text(

                      'Camera will be shown here',style: TextStyle(
                        fontSize: 30,

                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(Size(150, 150)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(70.0),
                                )
                            ),
                            elevation: MaterialStateProperty.all<double>(7),
                            backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainGridLineColor),
                          ),
                          onPressed: (){}, child: Text('Get In')),
                      Spacer(flex: 1,),
                      ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(Size(150, 150)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(70.0),
                                )
                            ),
                            elevation: MaterialStateProperty.all<double>(7),
                            backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainGridLineColor),
                          ),
                          onPressed: (){}, child: Text('Get Out')),
                    ],

                  ),
                ),
                Spacer(flex: 1),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: Joystick(
                        mode: _joystickMode,
                        listener: (details) {
                          setState(() {
                            _x = _x + step * details.x;
                            _y = _y + step * details.y;
                          });
                        },
                      ),
                    ),
                    Spacer(flex: 1,),
                    Container(
                      width: 180,
                      child: Joystick(
                        mode: _joystickMode,
                        listener: (details) {
                          setState(() {
                            _x = _x + step * details.x;
                            _y = _y + step * details.y;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,)





              ],
            )
        ),
      ),
    );
  }
}


