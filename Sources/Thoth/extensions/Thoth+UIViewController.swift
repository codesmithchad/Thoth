//
//  Thoth+UIViewController.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

extension UIViewController {

    @inlinable
    public func addChildVC(_ childController: UIViewController) {
        addChild(childController)
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
    }

    @inlinable
    public func removeChildVC() {
        guard self.parent != nil else {
            return
        }

        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
