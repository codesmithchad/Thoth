//
//  Thoth+UIWindow.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

extension UIWindow {

    @inlinable public var statusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }

    @inlinable public static var currentOrientation: UIInterfaceOrientation {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation ?? .portrait
        } else {
            return UIApplication.shared.statusBarOrientation
        }
    }
}
