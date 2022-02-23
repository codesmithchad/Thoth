//
//  ViewController.swift
//  Sample
//
//  Created by Ajiaco on 2022/02/21.
//

import UIKit
import Thoth

final class ViewController: UIViewController {
    
    private let scrollStackView = ScrollStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        ///*
        let button = UIButton()
        button.setTitle("test", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(testAction(_:)), for: .touchUpInside)
        button.debugBounds()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        // */
        
        view.addSubview(scrollStackView)
        scrollStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scrollStackView.debugBounds()
        
//        let colors: [UIColor] = [.red, .green, .blue]
//        let views: [UIView] = (0...10).enumerated().map({
//            let view = UIView()
//            view.backgroundColor = colors[$0.offset % 3]
//            view.widthAnchor.constraint(equalToConstant: 64).isActive = true
//            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
//            return view
//        })
        
        
    }
    ///*
    @objc private func testAction(_ button: UIButton) {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 64).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scrollStackView.addTab(view)
    }
    // */
    
    
}
