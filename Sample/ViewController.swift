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
    private var pageImageViewController = PageImageViewController()
    private let colors: [UIColor] = [.red, .green, .blue]

    override func viewDidLoad() {
        super.viewDidLoad()
//        setTestButton()
//        setScrollStackView()
        setSlideImageView()
    }
}

// MARK: - TestButton
extension ViewController {
    private func setTestButton() {
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
    }

    @objc private func testAction(_ button: UIButton) {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 64).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scrollStackView.addTab(view)
    }
}

// MARK: - ScrollStackView
extension ViewController {
    private func setScrollStackView() {
        view.addSubview(scrollStackView)
        scrollStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scrollStackView.debugBounds()
        
        (0...10).enumerated().forEach({ [weak self] in
            let view = UIView()
            view.backgroundColor = colors[$0.offset % 3]
            view.widthAnchor.constraint(equalToConstant: 64).isActive = true
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            self?.scrollStackView.addTab(view)
        })
    }
}

// MARK: - SlideImageView
extension ViewController {
    private func setSlideImageView() {
        let viewControllers: [UIViewController] = (0...4).enumerated().map({
            let viewController = UIViewController()
            viewController.view.backgroundColor = colors[$0.offset % 3]
            return viewController
        })
        pageImageViewController = PageImageViewController(subViewControllers: viewControllers)
        
        addChild(pageImageViewController)
        view.addSubview(pageImageViewController.view)
        pageImageViewController.didMove(toParent: self)
        pageImageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageImageViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pageImageViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageImageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pageImageViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
