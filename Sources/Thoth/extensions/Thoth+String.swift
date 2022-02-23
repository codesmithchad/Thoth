//
//  Thoth+String.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

extension String {

    @inlinable
    public var encodedURL: URL? {
        //    if let urlData = removingPercentEncoding {
        //        return URL(string: urlData.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        //    }
        //    return URL(string: addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")

        guard let urlData = removingPercentEncoding else {
            let string = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return URL(string: string ?? "")
        }
        return URL(string: urlData.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }

    @inlinable
    public func attributedString(_ lineHeightMultiple: CGFloat) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: .init(location: 0, length: attributedString.length))
        return attributedString
    }

    @inlinable
    public func toInt(value: Int = 0) -> Int {
        Int(self) ?? value
    }

    @inlinable
    public func slice(start: String, end: String) -> String? {
        guard let rangeStart = range(of: start)?.upperBound else { return nil }
        guard let rangeEnd = self[rangeStart...].range(of: end)?.lowerBound else { return nil }
        return String(self[rangeStart..<rangeEnd])
    }

}

extension String {
    // 사용 예 : label.attributedText = "HTMLSTRING".htmlEscaped()
    @inlinable
    public func htmlEscaped(font: UIFont? = nil, colorHex: String = "#000000", lineSpacing: CGFloat = 1.5) -> NSAttributedString {
        let htmlFont = font ?? UIFont.systemFont(ofSize: 15)
        let style = """
                    <style>
                    p.normal {
                      line-height: \(lineSpacing);
                      font-size: \(htmlFont.pointSize)px;
                      font-family: \(htmlFont.familyName);
                      color: \(colorHex);
                    }
                    </style>
        """
        let modified = String(format: "\(style)<p class=normal>%@</p>", self)
        do {
            guard let data = modified.data(using: .unicode) else {
                return NSAttributedString(string: self)
            }
            let attributed = try NSAttributedString(data: data,
                                                    options: [.documentType: NSAttributedString.DocumentType.html],
                                                    documentAttributes: nil)
            return attributed
        } catch {
            return NSAttributedString(string: self)
        }
    }
}

// MARK: - Attributed String

extension String {
    /// String을 NSAttributedString으로 변경
    /// - Parameters:
    ///   - font: UIFont
    ///   - color: UIColor
    /// - Returns: NSAttributedString
    @inlinable
    public func addAttribute(font: UIFont? = nil, color: UIColor? = nil) -> NSAttributedString {
        var attribute = [NSAttributedString.Key: Any]()
        if let font = font {
            attribute[.font] = font
        } else {
            attribute[.font] = UIFont.systemFont(ofSize: 14)
        }
        if let foregroundColor = color {
            attribute[.foregroundColor] = foregroundColor.cgColor
        }
        return NSAttributedString(string: self, attributes: attribute)
    }
}

extension NSAttributedString {

    @inlinable
    public static func concat(_ attributedStrings: NSAttributedString...) -> NSAttributedString {
        let returnAttString = NSMutableAttributedString()
        attributedStrings.forEach({ returnAttString.append($0) })
        return returnAttString
    }
}

extension NSMutableAttributedString {

    @inlinable
    @discardableResult
    public func addAttributes(font: UIFont, color: UIColor) -> NSMutableAttributedString {
        let range = NSRange(location: 0, length: length)
        addAttributes([.font: font, .foregroundColor: color], range: range)
        return self
    }

    @inlinable
    public func addLineSpacing(_ lineSpacing: CGFloat) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        let range = NSRange(location: 0, length: length)
        addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        return self
    }
}
