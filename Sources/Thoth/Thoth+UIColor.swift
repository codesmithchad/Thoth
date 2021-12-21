//
//  Thoth+UIColor.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

@available(iOS 13.0, *)
extension UIColor {

    convenience public init?(hexCode: String) {
        let hex = hexCode.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

        guard let int = Scanner(string: hex).scanInt32(representation: .hexadecimal) else { return nil }
        let alpha, red, green, blue: Int32
        switch hex.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (255, 0, 0, 0)
        }

        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: CGFloat(alpha) / 255.0)
    }

    static public func colorRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}
