
import 'package:go_router/go_router.dart';

import '../../features/presentation/views/home_view.dart';




abstract class AppRouters {
  static const kHomeView = '/';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],);
}