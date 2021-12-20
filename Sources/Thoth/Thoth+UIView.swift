//
//  Thoth+UIView.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/20.
//

import UIKit

extension UIView: Thoth {

    @inlinable
    public func addSubviews(_ subviews: UIView...) {
        for subview in subviews {
            addSubview(subview)
        }
    }
}
