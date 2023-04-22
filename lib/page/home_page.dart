import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_getx/controller/react_controller.dart';
import 'package:study_getx/controller/simple_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SimpleController()); // 단순 상태관리 controller 등록
    Get.put(ReactController()); // 반응형 상태관리 ㅊontroller 등록
    return Scaffold(
      appBar: AppBar(
        title: Text('단순 상태관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    // 단순 상태관리
            GetBuilder<SimpleController>(  
              // GetBuilder 대신에  Get.find<SimpleController>().increase(); 써도 된다.
              builder: (controller) {
                return ElevatedButton(
                  onPressed: () {
                    controller.increase();
                  },
                  child: Text(
                    '현재 숫자: ${controller.counter}',
                  ),
                );
              },
            ),

    // 반응형 상태관리 (방법 1.)
            GetX<ReactController>(
              builder: (controller) {
                return ElevatedButton(
                  onPressed: () {
                    controller.increase();
                  },
                  child: Text(
                    '반응형 1/ 현재 숫자 : ${controller.counter.value}',
                  ),
                );
              },
            ),

     // 반응형 상태관리(방법 2.) --> GetX()와 달리 controller의 이름을 지정할 수가 없어서 Get.find() 방식으로 접근해야 합니다.
            Obx(() {
              return ElevatedButton(
                onPressed: () {
                  Get.find<ReactController>().increase();
                },
                child: Text(
                  '반응형2 / 현재 숫자 : ${Get.find<ReactController>().counter.value}',
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
