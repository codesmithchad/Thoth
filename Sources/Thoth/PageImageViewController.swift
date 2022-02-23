//
//  PageImageViewController.swift
//  Thoth
//
//  Created by Ajiaco on 2022/02/23.
//

import UIKit

public class PageImageViewController: UIPageViewController {
    private var subViewControllers: [UIViewController]!
    
    public init(_ transitionStyle: UIPageViewController.TransitionStyle = .scroll,
                navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal,
                options: [UIPageViewController.OptionsKey : Any]? = nil,
                subViewControllers: [UIViewController] = []) {
        super.init(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: options)
        self.subViewControllers = subViewControllers
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        guard let firstSubViewController = subViewControllers.first else { return }
        setViewControllers([firstSubViewController], direction: .forward, animated: false, completion: nil)
        
    }
}

extension PageImageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        subViewControllers.count
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = subViewControllers?.firstIndex(of: viewController),
              let beforeViewController = subViewControllers?[safe: index - 1] else { return nil }
        return beforeViewController
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = subViewControllers?.firstIndex(of: viewController),
              let afterViewController = subViewControllers?[safe: index + 1] else { return nil }
        return afterViewController
    }
}
