abstract class NavigationInterface {
  Future<void> navigateToPage({required String path, Object? data});
  Future<void> navigateToPageClear({required String path, Object? data});
  Future<void> navigatePop();
}
