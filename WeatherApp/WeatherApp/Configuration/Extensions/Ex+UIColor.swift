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

extension UIColor {

  enum ExtensionName: String {
    case png
    case jpg
    case bmp
    case jpeg
    case jfif
  }

  /// Creates a color object with the image within the asset.
  /// - Parameters:
  ///   - named: image name
  ///   - extension: extension file name
  /// - Returns: UIColor object with image
  static func backgroundImage(named: String, extension: ExtensionName) -> UIColor? {
    guard let image = UIImage(named: "\(named).\(`extension`.rawValue)") else {
      return nil
    }
    return UIColor(patternImage: image)
  }
}
