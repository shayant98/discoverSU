import 'package:discoversu/app/locator.dart';
import 'package:discoversu/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  Future<void> navigateToPlace() async {
    print(123);
    await _navigationService.navigateTo(Routes.placeView);
  }
}
