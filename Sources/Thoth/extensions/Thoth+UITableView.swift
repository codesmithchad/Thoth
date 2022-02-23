//
//  Thoth+UITableView.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/31.
//

import UIKit

extension UITableView {
    @inlinable public var lastIndexPath: IndexPath? {
        let sections = numberOfSections
        guard sections > 0 else {
            return nil
        }
        
        let rows = numberOfRows(inSection: sections - 1)
        guard rows > 0 else {
            return nil
        }

        return IndexPath(row: rows - 1, section: sections - 1)
    }
    
//     @inlinable
//     public func lastIndexpath() -> IndexPath {
//         let section = max(numberOfSections - 1, 0)
//         let row = max(numberOfRows(inSection: section) - 1, 0)
//         return IndexPath(row: row, section: section)
//     }
}
