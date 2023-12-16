import 'package:flutter/material.dart';
import 'package:flutter_task/constants/sizeConstant.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        body:controller.expenseListAll.length == 0 ? Center(child: Text("No Expense")) : Obx(() {
          return ListView.builder(
              itemCount: controller.expenseListAll.length,
              itemBuilder: (context, index) {
                return Container(
                    height: MySize.getHeight(100),
                    width: MySize.getWidth(200),
                    child: Stack(
                      children: [
                        Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.formatDate(controller
                                        .expenseListAll[index].date
                                        .toString()),
                                    style: TextStyle(color: Colors.black),
                                  ),
                        
                        
                                ],
                              ),
                              Text(
                                controller.expenseListAll[index].category
                                    .toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                controller.expenseListAll[index].amount.toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                                                    ],
                                                  ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: (){

                                controller.deleteExpense(index);
                                },
                                child: Icon(Icons.cancel)),
                          ],
                        )
                      ],
                    ));
              });
        }),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add,size: 30,),
            onPressed: () {
          controller.dataEntry(context);

        }));
  }
}
