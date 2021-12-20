//
//  Thoth+UIAlertController.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/20.
//

import UIKit

public struct AlertAction {
    var title: String
    var action: ((UIAlertAction) -> Void)? = nil

    public init(_ title: String, _ action: ((UIAlertAction) -> Void)? = nil) {
        self.title = title
        self.action = action
    }
}

extension UIViewController {

    public func showAlert(_ message: String, title: String? = nil,
                          confirm: AlertAction? = nil, cancel: AlertAction? = nil,
                          completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        if let confirm = confirm {
            let action = UIAlertAction(title: confirm.title, style: .default, handler: confirm.action)
            alert.addAction(action)
        }

        if let cancel = cancel {
            let action = UIAlertAction(title: cancel.title, style: .cancel, handler: cancel.action)
            alert.addAction(action)
        }

        present(alert, animated: true, completion: completion)
    }
}
