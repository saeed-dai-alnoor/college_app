// ignore_for_file: library_private_types_in_public_api

import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:college_app/app/modules/student_login/controllers/student_login_controller.dart';
import 'package:college_app/app/modules/students_list/controllers/students_list_controller.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'image_slider.dart';
import 'animated_pages.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;

  int currentIndex = 0;
  double pageValue = 0.0;
  List<Map<String, dynamic>> movies = [];

  @override
  void initState() {
    super.initState();
    final getStorage = GetStorage();
    StudentsListController studentsListController =
        Get.put<StudentsListController>(StudentsListController());
    Get.put(LevelTypeController(), permanent: true);
    final studentLoginController =
        Get.put(StudentLoginController(), permanent: true);
    movies = [
      {
        'index': 0,
        'image': 'assets/images/jpg/queryBackground.jpg',
        'child': Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.grey[50],
          child: Scaffold(
            appBar: ScreensAppBar(
              title: 'query',
              back: false,
              height: 100.0,
            ),
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CommonStyle.commonText(
                      label: 'name',
                      color: Colors.black,
                      size: 18.0,
                    ),
                    Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: CommonStyle.commonText(
                              label: getStorage.read('studentName') == null
                                  ? '${studentLoginController.name}'
                                  : '${getStorage.read('studentName')}',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommonStyle.commonText(
                      label: 'studentId',
                      color: Colors.black,
                      size: 18.0,
                    ),
                    Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: CommonStyle.commonText(
                              label: '${getStorage.read('studentId')}',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommonStyle.commonText(
                      label: 'level',
                      color: Colors.black,
                      size: 18.0,
                    ),
                    Card(
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: CommonStyle.commonText(
                              label: studentsListController.levelName.value,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Card(
                      color: const Color(0xff00BB9F),
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: CommonStyle.commonText(
                              label: 'tuitionPayments',
                              color: Colors.white,
                            ),
                            onTap: () {
                              CommonMethods.moneyCustomDailog();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      },
      {
        'index': 1,
        'image': 'assets/images/jpg/lionKing.jpg',
        'child': Container(
          margin: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/jpg/soWhat.jpg'),
                  fit: BoxFit.fill)),
        ),
      },
      {
        'index': 2,
        'image': 'assets/images/jpg/queryBackground.jpg',
        'child': Obx(
          (() => Column(
                children: <Widget>[
                  const SizedBox(height: 12.0),
                  CommonStyle.commonText(
                    label: StudentsListController().getStorage.read('level') !=
                            null
                        ? studentsListController.levelName.value
                        : studentsListController
                            .levelTypeController.defaultLevel.value,
                    size: 18.0,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            future: studentsListController.fetchStudents(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return snapshot.hasData
                                  ? PlutoGrid(
                                      columns: studentsListController.columns,
                                      rows: studentsListController.rows,
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3.0,
                                      ),
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      },
      {
        'index': 3,
        'image': 'assets/images/jpg/lionKing.jpg',
        'child': Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/jpg/finish.jpg'),
                  fit: BoxFit.fill)),
        ),
      },
    ];
    _pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = _pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final reversedMovieList = movies.reversed.toList();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Stack(
              children: reversedMovieList.map((movie) {
                return ImageSlider(
                  pageValue: pageValue,
                  image: movie['image'],
                  index: movie['index'],
                );
              }).toList(),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.8]),
              ),
            ),
            AnimatedPages(
              pageValue: pageValue,
              pageController: _pageController,
              pageCount: movies.length,
              onPageChangeCallback: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              child: (index, _) => Container(
                margin: const EdgeInsets.fromLTRB(8.0, 220.0, 8.0, 0.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(
                          0.08,
                        ),
                        blurRadius: 4.0),
                  ],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  ),
                  color: Colors.white,
                ),
                child: movies[index]['child'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
