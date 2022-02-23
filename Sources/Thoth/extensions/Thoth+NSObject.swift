//
//  Thoth+NSObject.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/27.
//

import Foundation

extension NSObject {
    @inlinable public var className: String {
        String(describing: type(of: self))
    }
    
//    class var className: String {
//        String(describing: self)
//    }
}
