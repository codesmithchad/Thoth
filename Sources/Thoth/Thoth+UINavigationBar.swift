//
//  Thoth+UINavigationBar.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

@available(iOS 13.0, *)
extension UINavigationBar {

    @inlinable
    public func setBackgroundColor(_ color: UIColor, titleColor: UIColor = .white) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        navBarAppearance.backgroundColor = color
        navBarAppearance.shadowColor = .clear
        standardAppearance = navBarAppearance
        scrollEdgeAppearance = navBarAppearance
        barTintColor = color
    }
}

