import UIKit

class HomeCoordinator: Coordinator {

  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let homeVC = HomeViewController()
    navigationController.setViewControllers([homeVC], animated: false)
  }
}
