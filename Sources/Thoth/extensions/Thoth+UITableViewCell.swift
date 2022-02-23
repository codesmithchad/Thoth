//
//  Thoth+UITableViewCell.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

protocol ReusableTableViewCell {
    @inlinable static var reuseIdentifier: String { get }
}

extension ReusableTableViewCell {
    @inlinable public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableTableViewCell {}

