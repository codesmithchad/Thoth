//
//  Thoth+Collection.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    public subscript (safe index: Index) -> Iterator.Element? {
        indices.contains(index) ? self[index] : nil
    }
}
