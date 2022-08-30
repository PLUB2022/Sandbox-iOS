import UIKit

extension UIColor {

  /// Creates a color object with red, green, blue and alpha values.
  /// - Parameters:
  ///   - red: The red component of the color object, specified as a value from 0x00 to 0xFF.
  ///   - green: The green component of the color object, specified as a value from 0x00 to 0xFF.
  ///   - blue: The blue component of the color object, specified as a value from 0x00 to 0xFF.
  ///   - alpha: The alpha component of the color object, specified as a value from 0x00 to 0xFF.
  convenience init(red: Int, green: Int, blue: Int, alpha: Int = 0xFF) {
    self.init(
      red: CGFloat(red) / 255,
      green: CGFloat(green) / 255,
      blue: CGFloat(blue) / 255,
      alpha: CGFloat(alpha) / 255
    )
  }

  /// Creates a color object with a 6-digit value.
  /// - Parameter rgb: Six-digit integer values combined with red, green, and blue elements
  convenience init(rgb: Int) {
    self.init(
      red: rgb >> 16 & 0xFF,
      green: rgb >> 8 & 0xFF,
      blue: rgb & 0xFF
    )
  }
}
