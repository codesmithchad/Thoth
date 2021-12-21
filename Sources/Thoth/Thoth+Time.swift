//
//  Thoth+CMTime.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import Foundation
import AVFoundation

extension CMTime {
    @inlinable public var asDouble: Double {
        Double(self.value) / Double(self.timescale)
    }
    @inlinable public var asFloat: Float {
        Float(self.value) / Float(self.timescale)
    }
}

extension Double {
    static func zeroTimeString(_ count: Int = 1) -> String {
        if count == 2 {
            return "\(zeroTimeString()) / \(zeroTimeString())"
        }
        return "00:00:00"
    }

    public func timeString() -> String {
        if self.isNaN == true || self.isFinite == false {
            return Double.zeroTimeString()
        }
        var originValue = Int64(self)
        let second = originValue % 60
        originValue /= 60
        let minute = originValue % 60
        let hour = originValue / 60
        return "\(String(format: "%02d", hour)):\(String(format: "%02d", minute)):\(String(format: "%02d", second))"
    }
}
