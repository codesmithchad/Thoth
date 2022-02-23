//
//  ScrollStackView.swift
//  Thoth
//
//  Created by Ajiaco on 2022/02/23.
//

import UIKit

public class ScrollStackView: UIScrollView {
    
    private let stackView = UIStackView()
    
    public init(_ frame: CGRect = .zero,
         stackSubviews: [UIView] = [],
         inset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10),
         spacing: CGFloat = 8,
         showIndicator: Bool = false) {
        super.init(frame: frame)
        
        contentInset = inset
        showsHorizontalScrollIndicator = showIndicator
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = spacing
        
        for stackSubview in stackSubviews {
            stackView.addArrangedSubview(stackSubview)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addTab(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
    
    public func removeTab(_ index: Int) {
        guard let view = stackView.subviews[safe: index] else { return }
        stackView.removeArrangedSubview(view)
    }
}
