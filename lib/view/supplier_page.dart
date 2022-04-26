import 'package:activityapp/controller/supplier_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'landing_page.dart';

class SupplierPage extends StatelessWidget {
  final suppCon = Get.put(SupplierController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Supplier Info"),
          centerTitle: true,
          leading: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Get.off(() => LandingPage());
                },
              ),
            ),
          ),
        ),
        body: GetX<SupplierController>(
          builder: (controller) {
            return suppCon.isLoading.value == false
                ? Column(children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: controller.viewList != null
                            ? Container(
                                margin: EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Scrollbar(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: DataTable(
                                            columnSpacing: 10,
                                            columns: <DataColumn>[
                                              DataColumn(
                                                  label: Text("Nama Supplier")),
                                              DataColumn(label: Text("Alamat")),
                                              DataColumn(
                                                  label: Text("CP 1 Name")),
                                              DataColumn(
                                                  label: Text("CP 1 Phone")),
                                              DataColumn(
                                                  label: Text("CP 2 Name")),
                                              DataColumn(
                                                  label: Text("CP 2 Phone")),
                                            ],
                                            rows: controller.viewList
                                                .map(
                                                  ((element) => DataRow(
                                                        cells: <DataCell>[
                                                          DataCell(Text(element
                                                              .supplierName)),
                                                          DataCell(Text(element
                                                              .supplierAddr)),
                                                          DataCell(Text(element
                                                              .supplierCp)),
                                                          DataCell(Text(element
                                                              .supplierCpPhone)),
                                                          DataCell(Text(element
                                                              .supplierCp2)),
                                                          DataCell(Text(element
                                                              .supplierCpPhone2)),
                                                        ],
                                                      )),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                    ),
                    Container(
                        color: Colors.blue,
                        height: 100.0,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                            margin: EdgeInsets.all(20),
                            child: TextFormField(
                              controller: controller.txtSearch,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {
                                controller.getTableSupplier(value);
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Color(0xFFe7edeb),
                                  hintText: "Search",
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        controller.txtSearch.clear();
                                        // FocusScope.of(context)
                                        //     .requestFocus(FocusNode());
                                        // controller.getTableSupplier('');
                                      }),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey[600],
                                  )),
                            )))
                  ])
                : Center(
                    child: Container(
                        height: 250,
                        width: 250,
                        child: Lottie.asset('assets/images/loading.json')));
          },
        ));
  }
}
