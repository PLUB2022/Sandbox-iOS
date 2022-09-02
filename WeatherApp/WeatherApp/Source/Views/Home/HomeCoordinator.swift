import UIKit

class HomeCoordinator: Coordinator {

  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let homeVC = HomeViewController()
    homeVC.delegate = self
    navigationController.setViewControllers([homeVC], animated: false)
  }
}

extension HomeCoordinator: HomeViewControllerDelegate {
  func moveToAddViewController() {
    // TODO: Present Add View Controller
  }
}
