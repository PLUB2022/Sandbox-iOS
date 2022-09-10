import UIKit

class AddCityCoordinator: Coordinator {

  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let addCityVC = AddCityViewController()
    addCityVC.delegate = self
    navigationController.pushViewController(addCityVC, animated: true)
  }
}

extension AddCityCoordinator: AddCityViewControllerDelegate {

  func pop() {
    navigationController.popViewController(animated: true)
  }
}
