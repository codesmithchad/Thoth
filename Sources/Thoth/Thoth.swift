import UIKit
public struct Thoth {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        for subview in subviews {
            addSubview(subview)
        }
    }
}
