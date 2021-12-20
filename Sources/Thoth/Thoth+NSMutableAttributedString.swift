//
//  Thoth+NSMutableAttributedString.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/20.
//

import UIKit

extension NSMutableAttributedString: Thoth {
    @inlinable
    @discardableResult
    public func addFont(_ fontType: FontWeightType, range: NSRange) -> NSMutableAttributedString {
        self.addAttributes([.font: fontType.font()], range: range)
        return self
    }

    @inlinable
    @discardableResult
    public func addColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        self.addAttributes([.foregroundColor: color], range: range)
        return self
    }

    @inlinable
    public func attrString() -> NSAttributedString {
        return NSAttributedString(attributedString: self)
    }
}

public enum FontWeightType {
    case ultraLight(CGFloat)
    case thin(CGFloat)
    case light(CGFloat)
    case regular(CGFloat)
    case medium(CGFloat)
    case semibold(CGFloat)
    case bold(CGFloat)
    case heavy(CGFloat)
    case black(CGFloat)

    public func font() -> UIFont {
        var fontSize: CGFloat = 12
        var fontWeight: UIFont.Weight = .regular

        switch self {
        case .ultraLight(let size):
            fontSize = size; fontWeight = .ultraLight
        case .thin(let size):
            fontSize = size; fontWeight = .thin
        case .light(let size):
            fontSize = size; fontWeight = .light
        case .regular(let size):
            fontSize = size; fontWeight = .regular
        case .medium(let size):
            fontSize = size; fontWeight = .medium
        case .semibold(let size):
            fontSize = size; fontWeight = .semibold
        case .bold(let size):
            fontSize = size; fontWeight = .bold
        case .heavy(let size):
            fontSize = size; fontWeight = .heavy
        case .black(let size):
            fontSize = size; fontWeight = .black
        }

        return UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
}
