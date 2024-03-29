import 'package:get/get.dart';

import '../modules/advertisement/bindings/advertisement_binding.dart';
import '../modules/advertisement/views/advertisement_view.dart';
import '../modules/languages_type/bindings/languages_type_binding.dart';
import '../modules/languages_type/views/languages_type_view.dart';
import '../modules/lessons_tables/bindings/lessons_tables_binding.dart';
import '../modules/lessons_tables/views/lessons_tables_view.dart';
import '../modules/level_creating/bindings/level_creating_binding.dart';
import '../modules/level_creating/views/level_creating_view.dart';
import '../modules/level_deleting/bindings/level_deleting_binding.dart';
import '../modules/level_deleting/views/level_deleting_view.dart';
import '../modules/level_type/bindings/level_type_binding.dart';
import '../modules/level_type/views/level_type_view.dart';
import '../modules/level_updating/bindings/level_updating_binding.dart';
import '../modules/level_updating/views/level_updating_view.dart';
import '../modules/levels_getting/bindings/levels_getting_binding.dart';
import '../modules/levels_getting/views/levels_getting_view.dart';
import '../modules/management_home/bindings/management_home_binding.dart';
import '../modules/management_home/views/management_home_view.dart';
import '../modules/management_login/bindings/management_login_binding.dart';
import '../modules/management_login/views/management_login_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/parents_login/bindings/parents_login_binding.dart';
import '../modules/parents_login/views/parents_login_view.dart';
import '../modules/semester_type/bindings/semester_type_binding.dart';
import '../modules/semester_type/views/semester_type_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/start/bindings/start_binding.dart';
import '../modules/start/views/start_view.dart';
import '../modules/student_adding/bindings/student_adding_binding.dart';
import '../modules/student_adding/views/student_adding_view.dart';
import '../modules/student_deleting/bindings/student_deleting_binding.dart';
import '../modules/student_deleting/views/student_deleting_view.dart';
import '../modules/student_home/bindings/student_home_binding.dart';
import '../modules/student_home/views/student_home_view.dart';
import '../modules/student_login/bindings/student_login_binding.dart';
import '../modules/student_login/views/student_login_view.dart';
import '../modules/student_query/bindings/student_query_binding.dart';
import '../modules/student_query/views/student_query_view.dart';
import '../modules/student_setting/bindings/student_setting_binding.dart';
import '../modules/student_setting/views/student_setting_view.dart';
import '../modules/students_list/bindings/students_list_binding.dart';
import '../modules/students_list/views/students_list_view.dart';
import '../modules/subjects/bindings/subjects_binding.dart';
import '../modules/subjects/views/subjects_view.dart';
import '../modules/teacher_creating/bindings/teacher_creating_binding.dart';
import '../modules/teacher_creating/views/teacher_creating_view.dart';
import '../modules/teacher_deleting/bindings/teacher_deleting_binding.dart';
import '../modules/teacher_deleting/views/teacher_deleting_view.dart';
import '../modules/teacher_home/bindings/teacher_home_binding.dart';
import '../modules/teacher_home/views/teacher_home_view.dart';
import '../modules/teacher_login/bindings/teacher_login_binding.dart';
import '../modules/teacher_login/views/teacher_login_view.dart';
import '../modules/teacher_setting/bindings/teacher_setting_binding.dart';
import '../modules/teacher_setting/views/teacher_setting_view.dart';
import '../modules/teacher_updating/bindings/teacher_updating_binding.dart';
import '../modules/teacher_updating/views/teacher_updating_view.dart';
import '../modules/teachers_getting/bindings/teachers_getting_binding.dart';
import '../modules/teachers_getting/views/teachers_getting_view.dart';
import '../modules/teachers_list/bindings/teachers_list_binding.dart';
import '../modules/teachers_list/views/teachers_list_view.dart';
import '../modules/user_kind/bindings/user_kind_binding.dart';
import '../modules/user_kind/views/user_kind_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.START,
      page: () => const StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.USER_KIND,
      page: () => const UserKindView(),
      binding: UserKindBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_LOGIN,
      page: () => const StudentLoginView(),
      binding: StudentLoginBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_HOME,
      page: () => const StudentHomeView(),
      binding: StudentHomeBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_LOGIN,
      page: () => const TeacherLoginView(),
      binding: TeacherLoginBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_HOME,
      page: () => const TeacherHomeView(),
      binding: TeacherHomeBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECTS,
      page: () => const SubjectsView(),
      binding: SubjectsBinding(),
    ),
    GetPage(
      name: _Paths.LESSONS_TABLES,
      page: () => const LessonsTablesView(),
      binding: LessonsTablesBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTS_LIST,
      page: () => const StudentsListView(),
      binding: StudentsListBinding(),
    ),
    GetPage(
      name: _Paths.ADVERTISEMENT,
      page: () => const AdvertisementView(),
      binding: AdvertisementBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.LEVEL_TYPE,
      page: () => const LevelTypeView(),
      binding: LevelTypeBinding(),
    ),
    GetPage(
      name: _Paths.SEMESTER_TYPE,
      page: () => const SemesterTypeView(),
      binding: SemesterTypeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGES_TYPE,
      page: () => LanguagesTypeView(),
      binding: LanguagesTypeBinding(),
    ),
    GetPage(
      name: _Paths.MANAGEMENT_LOGIN,
      page: () => const ManagementLoginView(),
      binding: ManagementLoginBinding(),
    ),
    GetPage(
      name: _Paths.MANAGEMENT_HOME,
      page: () => const ManagementHomeView(),
      binding: ManagementHomeBinding(),
    ),
    GetPage(
      name: _Paths.PARENTS_LOGIN,
      page: () => const ParentsLoginView(),
      binding: ParentsLoginBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_QUERY,
      page: () => const StudentQueryView(),
      binding: StudentQueryBinding(),
    ),
    GetPage(
      name: _Paths.TEACHERS_LIST,
      page: () => const TeachersListView(),
      binding: TeachersListBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_SETTING,
      page: () => const StudentSettingView(),
      binding: StudentSettingBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_SETTING,
      page: () => const TeacherSettingView(),
      binding: TeacherSettingBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_ADDING,
      page: () => const StudentAddingView(),
      binding: StudentAddingBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_DELETING,
      page: () => const StudentDeletingView(),
      binding: StudentDeletingBinding(),
    ),
    GetPage(
      name: _Paths.LEVEL_DELETING,
      page: () => const LevelDeletingView(),
      binding: LevelDeletingBinding(),
    ),
    GetPage(
      name: _Paths.LEVEL_UPDATING,
      page: () => const LevelUpdatingView(),
      binding: LevelUpdatingBinding(),
    ),
    GetPage(
      name: _Paths.LEVELS_GETTING,
      page: () => const LevelsGettingView(),
      binding: LevelsGettingBinding(),
    ),
    GetPage(
      name: _Paths.LEVEL_CREATING,
      page: () => const LevelCreatingView(),
      binding: LevelCreatingBinding(),
    ),
    GetPage(
      name: _Paths.TEACHERS_GETTING,
      page: () => const TeachersGettingView(),
      binding: TeachersGettingBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_CREATING,
      page: () => const TeacherCreatingView(),
      binding: TeacherCreatingBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_UPDATING,
      page: () => const TeacherUpdatingView(),
      binding: TeacherUpdatingBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_DELETING,
      page: () => const TeacherDeletingView(),
      binding: TeacherDeletingBinding(),
    ),
  ];
}
