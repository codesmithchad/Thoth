//
//  Thoth+Debug.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

extension UIView {

    @inlinable
    public func debugBounds(_ color: UIColor = UIColor.red, _ width: CGFloat = 1) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.withAlphaComponent(0.6).cgColor
    }
}
