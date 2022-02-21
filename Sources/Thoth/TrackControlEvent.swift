//
//  TrackControlEvent.swift
//  Thoth
//
//  Created by Ajiaco on 2022/02/21.
//

import UIKit

extension UIButton {
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
        
        guard let identifier = accessibilityIdentifier else {
            print("[Tracker] warn: UIButton의 accessibilityIdentifier가 지정되어 있지 않음")
            return
        }
        
        guard let parentIdentifier = superview?.accessibilityIdentifier else {
            print("[Tracker] warn: UIButton 상위뷰의 accessibilityIdentifier가 지정되어 있지 않음")
            return
        }
        
        print("[Tracker] identifier:\(identifier) / parentIdentifier:\(parentIdentifier)")
    }
}

extension UIDatePicker {
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
    }
}

extension UIPageControl {
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
    }
}

extension UISegmentedControl {
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
    }
}

extension UISlider {
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
    }
}

extension UIStepper {
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
    }
}

extension UISwitch {
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
    }
}

extension UIRefreshControl {
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
    }
}
