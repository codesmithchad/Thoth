//
//  LoopableExtension.swift
//  Thoth
//
//  Created by Ajiaco on 2022/02/16.
//

import Foundation

public protocol Loopable {
    func allProperties() throws -> [String: Any]
}

extension Loopable {
    public func allProperties() throws -> [String: Any] {
        var result: [String: Any] = [:]
        let mirror = Mirror(reflecting: self)

        // Optional check to make sure we're iterating over a struct or class
        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            throw NSError()
        }

        for (property, value) in mirror.children {
            guard let property = property else {
                continue
            }

            result[property] = value
        }

        return result
    }
}

