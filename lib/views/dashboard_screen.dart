import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/colors.dart';
import '../controllers/get_subscribeds.dart';
import '../controllers/usercount.dart';
import '../providers/all_user.dart';
import '../providers/count_coach_client.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _clientCount = 0;
  int _coachCount = 0;
  int _total = 0;
  Future<void> fetchClientCount() async {
    final count = await getUsersCount('clientKey');
    setState(() {
      _clientCount = count;
    });
  }

  Future<void> fetchCoachCount() async {
    final count = await getUsersCount('coachKey');

    setState(() {
      _coachCount = count;
    });
  }

  Future<int> getClientCount(String id) async {
    final count = await getClientTotal(id);
    return count;
  }

  Future<int> getCoachCount(String id) async {
    final count = await getCoachTotal(id);
    return count;
  }

  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    fetchClientCount();
    fetchCoachCount();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          //Let's start by adding the Navigation Rail
          NavigationRail(
              extended: isExpanded,
              backgroundColor: AppColors().primaryColor,
              unselectedIconTheme:
                  IconThemeData(color: Colors.white, opacity: 1),
              unselectedLabelTextStyle: TextStyle(
                color: Colors.white,
              ),
              selectedIconTheme:
                  IconThemeData(color: Colors.deepPurple.shade900),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Home"),
                ),
                // NavigationRailDestination(
                //   icon: Icon(Icons.bar_chart),
                //   label: Text("Rapports"),
                // ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Profile"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text("Settings"),
                ),
              ],
              selectedIndex: 0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(60.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //let's add the navigation menu for this project
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            //let's trigger the navigation expansion
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          icon: Icon(Icons.menu),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //Now let's start with the dashboard main rapports
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(size.width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: size.width * 0.02,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Text(
                                        "Coaches",
                                        style: TextStyle(
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "Total: $_coachCount",
                                    style: TextStyle(
                                      fontSize: size.width * 0.02,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(size.width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_2,
                                        size: size.width * 0.02,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Text(
                                        "Clients",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "Total: $_clientCount",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: size.width * 0.02,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(size.width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        size: size.width * 0.02,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Text(
                                        "Revenue",
                                        style: TextStyle(
                                          fontSize: size.width * 0.03,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "0 \$",
                                    style: TextStyle(
                                      fontSize: size.width * 0.02,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Now let's set the article section
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       children: [
                    //         Text(
                    //           "All Users",
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: size.width * 0.04,
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: size.height * 0.01,
                    //         ),
                    //         Text(
                    //           "A 360° look at your users",
                    //           style: TextStyle(
                    //               color: Colors.grey,
                    //               fontSize: size.width * 0.03,
                    //               fontWeight: FontWeight.w400),
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       width: size.width * 0.4,
                    //       child: TextField(
                    //         decoration: InputDecoration(
                    //           hintText: "Search for users",
                    //           prefixIcon: Icon(
                    //             Icons.search,
                    //             color: AppColors().primaryColor,
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderSide: BorderSide(
                    //               color: AppColors().primaryColor,
                    //             ),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(
                    //               color: AppColors().primaryColor,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        // Check the available width
                        if (constraints.maxWidth < 600) {
                          // Switch to column layout if the width is less than 600
                          return Column(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "All Users",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.03,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "A 360° look at your users",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: size.width * 0.02,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              // TextField(
                              //   decoration: InputDecoration(
                              //     hintText: "Search for users",
                              //     prefixIcon: Icon(
                              //       Icons.search,
                              //       color: AppColors().primaryColor,
                              //     ),
                              //     border: OutlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: AppColors().primaryColor,
                              //       ),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: AppColors().primaryColor,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          );
                        } else {
                          // Use row layout if the width is 600 or more
                          return Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "All Users",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.02,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "A 360° look at your users",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: size.width * 0.01,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.2,
                              ), // Add some spacing between the text and the TextField
                              // Expanded(
                              //   child: TextField(
                              //     decoration: InputDecoration(
                              //       hintText: "Search for users",
                              //       prefixIcon: Icon(
                              //         Icons.search,
                              //         color: AppColors().primaryColor,
                              //       ),
                              //       border: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //           color: AppColors().primaryColor,
                              //         ),
                              //       ),
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //           color: AppColors().primaryColor,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),

                    // //let's set the filter section
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     TextButton.icon(
                    //       onPressed: () {},
                    //       icon: Icon(
                    //         Icons.arrow_back,
                    //         color: Colors.deepPurple.shade400,
                    //       ),
                    //       label: Text(
                    //         "2022, July 14, July 15, July 16",
                    //         style: TextStyle(
                    //           color: Colors.deepPurple.shade400,
                    //         ),
                    //       ),
                    //     ),
                    //     Row(
                    //       children: [
                    //         DropdownButton(
                    //             hint: Text("Filter by"),
                    //             items: [
                    //               DropdownMenuItem(
                    //                 value: "Date",
                    //                 child: Text("Date"),
                    //               ),
                    //               DropdownMenuItem(
                    //                 value: "Comments",
                    //                 child: Text("Comments"),
                    //               ),
                    //               DropdownMenuItem(
                    //                 value: "Views",
                    //                 child: Text("Views"),
                    //               ),
                    //             ],
                    //             onChanged: (value) {}),
                    //         SizedBox(
                    //           width: 20.0,
                    //         ),
                    //         DropdownButton(
                    //             hint: Text("Order by"),
                    //             items: [
                    //               DropdownMenuItem(
                    //                 value: "Date",
                    //                 child: Text("Date"),
                    //               ),
                    //               DropdownMenuItem(
                    //                 value: "Comments",
                    //                 child: Text("Comments"),
                    //               ),
                    //               DropdownMenuItem(
                    //                 value: "Views",
                    //                 child: Text("Views"),
                    //               ),
                    //             ],
                    //             onChanged: (value) {}),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 40.0,
                    // ),
                    // //Now let's add the Table
                    Consumer(builder: (context, ref, _) {
                      final userResult = ref.watch(coachProvider);
                      ref.refresh(coachProvider);
                      return userResult.when(
                        data: (userModel) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DataTable(
                                headingRowColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.grey.shade200),
                                columns: const [
                                  DataColumn(label: Text("Name")),
                                  DataColumn(label: Text("Email")),
                                  DataColumn(label: Text("User Type")),
                                  DataColumn(
                                      label: Text("Total Clients/Cocahes")),
                                ],
                                rows: userModel.map((user) {
                                  final name = user.firstName;
                                  final email = user.email;
                                  final userType = user.userType;
                                  final cc = ref
                                      .watch(getClientTotalProvider(user.uid)).value;
                                  final aa = ref
                                      .watch(getCoachTotalProvider(user.uid)).value;

                                  return DataRow(
                                    cells: [
                                      DataCell(Text(name)),
                                      DataCell(Text(email)),
                                      DataCell(
                                        Text(userType == 'clientKey'
                                            ? "Client"
                                            : "Coach"),
                                      ),
                                      DataCell(Text(userType == 'clientKey'
                                          ? "$cc"
                                          : "$aa")),
                                    ],
                                  );
                                }).toList(),
                              ),
                              //Now let's set the pagination
                              const SizedBox(
                                height: 40.0,
                              ),
                            ],
                          );
                        },
                        loading: () => const Text("..."),
                        error: (error, stackTrace) => Text('Error: $error'),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      //let's add the floating action button
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.deepPurple.shade400,
      // ),
    );
  }
}
