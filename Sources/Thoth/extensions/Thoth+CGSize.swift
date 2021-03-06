//
//  Thoth+CGSize.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/20.
//

import UIKit

extension CGSize {
    
    @inlinable
    public var ratio: CGFloat {
        if width == 0 { return 0.0 }
        return height / width
    }

    @inlinable
    public var ratioReverse: CGFloat {
        if height == 0 { return 0.0 }
        return width / height
    }

    @inlinable
    public var scaled: Self {
        return Self.init(width: width * UIScreen.main.scale, height: height * UIScreen.main.scale)
    }
}
