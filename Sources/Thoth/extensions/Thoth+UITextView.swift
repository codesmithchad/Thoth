//
//  Thoth+UITextView.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

extension UITextView {

    @inlinable
    public func textLines() -> Int {
        let estimatedSize = sizeThatFits(.init(width: frame.width, height: .infinity))
        let font = self.font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        return Int(estimatedSize.height / font.lineHeight)
    }

    @inlinable
    public func textContainerHeight(lines: Int? = nil) -> CGFloat {
        let lines = lines ?? textLines()
        let font = self.font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        return ceil(font.lineHeight * CGFloat(lines))
    }
}

