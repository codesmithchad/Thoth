//
//  Thoth+Int.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import Foundation

extension Int {

    @inlinable
    public func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? "there's no number"
    }

    @inlinable
    public func withCommas(limit: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if self > limit, let string = numberFormatter.string(from: NSNumber(value: limit)) {
            return string.appending("+")
        }
        return numberFormatter.string(from: NSNumber(value: self)) ?? "unknown"
    }

    @inlinable
    public func toString() -> String {
        return String(self)
    }
}
