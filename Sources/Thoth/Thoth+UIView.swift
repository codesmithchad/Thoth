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

    @inlinable
    public func removeSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }

    @inlinable
    public func fadeInOut(willShow: Bool = true, _ duration: TimeInterval = 0.25) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.alpha = willShow ? 1 : 0
//            self?.isUserInteractionEnabled = willShow
        }
    }
}
