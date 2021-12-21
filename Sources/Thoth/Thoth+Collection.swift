//
//  Thoth+Collection.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
