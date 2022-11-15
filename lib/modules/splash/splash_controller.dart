import 'package:get/get.dart';
import '../../data/repositories/merchant_repository.dart';
import '../../routes/app_pages.dart';
import '../../utilities/constants.dart';
import '../../utilities/ui/functions/show_adaptive_dialog.dart';

class SplashController extends GetxController {
  SplashController(this._repository);
  final MerchantRepository _repository;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    loadMerchants();
  }

  @override
  void onClose() {
    super.onClose();
    isLoading.close();
  }

  Future<void> loadMerchants() async {
    try {
      await _repository.getAll();
      await loadBatches();
      _doHome();
    } catch (e) {
      showAdaptiveDialog(title: 'Load Merchants Error', content: e.toString());
    }
  }

  Future<void> loadBatches() async {
    try {
      await _repository.getBatches(redRobinMerchantMid);
    } catch (e) {
      showAdaptiveDialog(title: 'Load Batches Error', content: e.toString());
    }
  }

  _doHome() async {
    try {
      Get.offNamed(Routes.HOME);
    } catch (e) {
      print(e);
    }
  }
}
