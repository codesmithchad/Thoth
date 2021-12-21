//
//  Thoth+UITextField.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

public enum TextFieldPaddingPosition {
    case left, right
}

extension UITextField {

    @inlinable
    public func addPadding(_ position: TextFieldPaddingPosition, _ width: CGFloat = 0) {
        let paddingView = UIView(frame: .zero)
        paddingView.frame.size = CGSize(width: width, height: frame.self.height)
        switch position {
        case .left:
            leftView = paddingView
            leftViewMode = .always
        case .right:
            rightView = paddingView
            rightViewMode = .always
        }
    }

    @inlinable
    public func setPlaceholder(_ title: String, color: UIColor, font: UIFont? = nil) {
        let attributes = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        ]
        attributedPlaceholder = NSAttributedString(string: title, attributes: attributes)
    }
}
