//
//  Thoth+Array.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import Foundation

extension Array {

    public subscript(safe range: Range<Index>) -> ArraySlice<Element> {
        return self[Swift.min(range.lowerBound, endIndex)..<Swift.min(range.upperBound, endIndex)]
    }

    @inlinable
    @discardableResult
    public mutating func removeFirstIfExist() -> Array.Element? {
        return count > 0 ? removeFirst() : nil
    }

    @inlinable
    @discardableResult
    public mutating func removeLastIfExist() -> Array.Element? {
        return count > 0 ? removeLast() : nil
    }
}
