//
//  Thoth+UIButton.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

extension UIButton {
    
    @inlinable
    public func setBackgroundColor(_ color: UIColor, state: UIControl.State) {
        guard let solidImage = UIImage.solidImage(color) else { return }
        setBackgroundImage(solidImage, for: state)
    }
}
