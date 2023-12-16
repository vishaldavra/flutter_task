import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/app/ExtraModels/ExpenseModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/ArgumentConstants.dart';
import '../../../../constants/mytext_field.dart';
import '../../../../constants/sizeConstant.dart';
import '../../../../main.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TextEditingController> amount_controller = TextEditingController().obs;
  Rx<TextEditingController> description_controller =
      TextEditingController().obs;
  Rx<TextEditingController> category_controller = TextEditingController().obs;
  Rx<ExpenseModel> expenseEntered = Rx(ExpenseModel());
  RxList<ExpenseModel> expenseListAll = <ExpenseModel>[].obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (box.read(ArgumentConstants.ExpenseList) != null) {
      List<dynamic> decodedList =
      jsonDecode(box.read(ArgumentConstants.ExpenseList));
      expenseListAll = RxList<ExpenseModel>(
          decodedList.map((item) => ExpenseModel.fromJson(item)).toList());

    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
    }
  }

  dataEntry(BuildContext context) {
    Get.dialog(AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          height: MySize.getHeight(570),
          width: MySize.getWidth(300),
          child: Obx(() {
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      selectDate(context);
                    },
                    child: Container(
                      width: MySize.safeWidth,
                      height: MySize.getHeight(50),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          )),
                      child: Center(
                        child: Row(
                          children: [
                            Spacing.width(10),
                            Text(
                              selectedDate.value != ""
                                  ? selectedDate.value
                                      .toString()
                                      .substring(0, 10)
                                  : "Date",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacing.height(10),
                  CustomTextField(
                      controller: amount_controller.value,
                      keyboardType: TextInputType.number,
                      // controller: item_controller.value,
                      hintText: 'Amount',
                      labelText: 'Amount',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Amount';
                        }
                        return null;
                      }),
                  Spacing.height(10),
                  CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: category_controller.value,
                      hintText: 'Category',
                      labelText: 'Category',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Category';
                        }
                        return null;
                      }),
                  Spacing.height(10),
                  CustomTextField(
                      controller: description_controller.value,
                      keyboardType: TextInputType.number,
                      // controller: item_controller.value,
                      hintText: 'Description',
                      labelText: 'Description',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Description';
                        }
                        return null;
                      }),
                  Spacing.height(20),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        addData();
                      }
                    },
                    child: Container(
                      height: MySize.setScaleHeight(0.05),
                      width: MySize.setScaleHeight(0.3),
                      child: Center(
                          child: Text(
                        "Add Expense",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            );
          }),
        )));
  }

  addData() {
    expenseEntered.value.amount = amount_controller.value.text;
    expenseEntered.value.date = selectedDate.value.toString();
    expenseEntered.value.description = description_controller.value.text;
    expenseEntered.value.category = category_controller.value.text;
    if (box.read(ArgumentConstants.ExpenseList) != null) {
      List<dynamic> decodedList =
          jsonDecode(box.read(ArgumentConstants.ExpenseList));
      RxList<ExpenseModel> expenseList = RxList<ExpenseModel>(
          decodedList.map((item) => ExpenseModel.fromJson(item)).toList());
      expenseList.add(expenseEntered.value);
      expenseListAll.value=expenseList;
      box.write(ArgumentConstants.ExpenseList, jsonEncode(expenseList));
    } else {
      RxList<ExpenseModel> expenseList = RxList<ExpenseModel>([]);
      expenseList.add(expenseEntered.value);
      expenseListAll.value=expenseList;
      box.write(ArgumentConstants.ExpenseList, jsonEncode(expenseList));
    }
    amount_controller.value.clear();
    description_controller.value.clear();
    category_controller.value.clear();
    selectedDate.value = DateTime.now();
    update();
    Get.back();
  }
  deleteExpense(int index) {
    expenseListAll.removeAt(index);
    box.write(ArgumentConstants.ExpenseList, jsonEncode(expenseListAll));

  }
  String formatDate(String dateStr) {
    DateTime parsedDate = DateTime.parse(dateStr);
    return DateFormat('dd MMM yyyy').format(parsedDate);
  }
}
DataRow expenseDataRow({required ExpenseModel data}) {
  return DataRow(
    cells: [
      DataCell(Padding(
        padding: EdgeInsets.only(left: 15),
        child: Text(data.date.toString(),
            style: TextStyle(color: Colors.black)),
      )),
      DataCell(Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(data.amount.toString(),
            style: TextStyle(color: Colors.black)),
      )),
      DataCell(Padding(
        padding: EdgeInsets.only(left: 10),
        child:
        Text(data.category.toString(), style: TextStyle(color: Colors.black)),
      )),
      DataCell(Padding(
        padding: EdgeInsets.only(left: 2),
        child: Text(data.description.toString(),
            style: TextStyle(color: Colors.black)),
      )),

    ],
  );
}