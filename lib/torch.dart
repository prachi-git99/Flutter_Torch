

import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class Torch extends StatefulWidget {
  const Torch({Key? key}) : super(key: key);

  @override
  State<Torch> createState() => _TorchState();
}

class _TorchState extends State<Torch> {
  final bgColor = const Color(0xff2C3333);
  final textColor = const Color(0xffE7f6F2);
  var controller = TorchController();
  var isActive =false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: "Flashlite"
            .text.color(textColor)
            .fontWeight(FontWeight.w400)
            .make(),
      ),
      body: Column(
        children: [
          // SizedBox(height: 50.0,),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(isActive?"assets/torch on.png":'assets/torch off.png',
                        width: 200,
                        height: 200,
                        color: isActive? null : textColor.withOpacity(0.5),
                      ),
                      const SizedBox(
                        height:20.0,
                      ),
                      CircleAvatar(
                        child: Transform.scale(
                          scale: 1.5,
                          child: IconButton(
                            onPressed: (){
                              controller.toggle();
                              isActive = !isActive;
                              setState(() {

                              });
                            },
                            icon:Icon(Icons.power_settings_new),
                          ),
                        ),
                        minRadius:25,
                        maxRadius:30,

                      ),

                    ],
                  ),
                ),
              ),
          ),
          Text(
            "Developed by Prachi Verma",
            style: TextStyle(color:textColor,fontSize:12.0,fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height:10.0,
          )
        ],
      ),
    );
  }
}
