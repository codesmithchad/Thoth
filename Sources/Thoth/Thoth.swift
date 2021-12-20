import UIKit

public protocol Thoth {}

extension Thoth where Self: Any {

}

extension UIView: Thoth {
    func addSubviews(_ subviews: UIView...) {
        for subview in subviews {
            addSubview(subview)
        }
    }
}
