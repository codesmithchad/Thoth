//
//  Thoth+UIScreen.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

extension UIScreen {

    @inlinable public static var size: CGSize { UIScreen.main.bounds.size }
    @inlinable public static var width: CGFloat { UIScreen.main.bounds.width }
    @inlinable public static var height: CGFloat { UIScreen.main.bounds.height }
}
