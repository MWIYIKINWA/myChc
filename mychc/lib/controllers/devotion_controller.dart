import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychc/models/devotion_model.dart';
import 'package:mychc/services/api_service.dart';

final devotionControllerProvider =
    StateNotifierProvider<DevotionController, AsyncValue<List<Devotion>>>((
      ref,
    ) {
      return DevotionController();
    });

class DevotionController extends StateNotifier<AsyncValue<List<Devotion>>> {
  DevotionController() : super(const AsyncValue.loading()) {
    fetchDevotions();
  }

  final ApiService _apiService = ApiService();

  Future<void> fetchDevotions() async {
    try {
      // If you need authentication, get the token from your auth controller
      // For now, we'll pass null since your sermons endpoint might be public
      final devotions = await _apiService.getDevotions(null);
      state = AsyncValue.data(devotions);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await fetchDevotions();
  }
}
