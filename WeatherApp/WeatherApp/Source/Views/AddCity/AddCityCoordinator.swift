import UIKit

class AddCityCoordinator: Coordinator {

  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let addCityVC = AddCityViewController()
    navigationController.pushViewController(addCityVC, animated: true)
  }
}
