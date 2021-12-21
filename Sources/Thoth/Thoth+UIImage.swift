//
//  Thoth+UIImage.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

extension UIImage {

    @inlinable
    public static func solidImage(_ color: UIColor, size: CGSize = .zero) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
