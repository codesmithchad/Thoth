//
//  ViewController.swift
//  Sample
//
//  Created by Ajiaco on 2022/02/21.
//

import UIKit
import Thoth

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        view.accessibilityIdentifier = "blah blah view"
        button.accessibilityIdentifier = "blah blah buton"
        button.setTitle("test", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(testAction(_:)), for: .touchUpInside)
        button.debugBounds()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    @objc
    private func testAction(_ button: UIButton) {
        print("OK")
    }
}

