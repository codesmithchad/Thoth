//
//  PaddedLabel.swift
//  Thoth
//
//  Created by hmbp on 2022/01/21.
//

import UIKit

public class PaddedLabel: UILabel {

    private var padding = UIEdgeInsets()

    convenience init(_ padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    public override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }
}
