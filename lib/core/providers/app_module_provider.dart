import 'package:flutter_go_router/core/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref: ref));
