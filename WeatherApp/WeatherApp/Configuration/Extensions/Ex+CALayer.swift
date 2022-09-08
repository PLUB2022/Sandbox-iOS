import UIKit

import Then

extension CALayer {
  static var gradientBackground: CAGradientLayer {
    return CAGradientLayer().then {
      $0.colors = [
        UIColor.init(rgb: 0x2E335A).cgColor,
        UIColor.init(rgb: 0x1C1B33).cgColor
      ]
      $0.locations = [0, 1]
    }
  }
}
