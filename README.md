# Thoth

v0.0.12

## Thoth


## Thoth+Array
    * mutating func removeFirstIfExist() -> Array.Element?
    * mutating func removeLastIfExist() -> Array.Element?

## Thoth+CALayer
    * func addSublayers(_ layers: CALayer...)
    * func addBorder(_ edges: [UIRectEdge], color: UIColor, width: CGFloat)
    * class func withDisabledActions<T>(_ body: () throws -> T) rethrows -> T

## Thoth+CGSize
    * var ratio: CGFloat
    * var ratioReverse: CGFloat
    * var scaled: CGSize

## Thoth+Collection
    * subscript(safe index: Index) -> Element?


## Thoth+Date
    * static var localDate: Date
    * static var nowUTC: String
    * func toString(dateFormat format: String, timeZoneValue: TimeZone?) -> String
    * func toString(dateFormat format: String, timeZone: String? = nil) -> String
    * func toStringKST(dateFormat format: String = "yyyy-MM-dd HH:mm:ss") -> String
    * func toStringUTC(dateFormat format: String) -> String
    * func getCompare(compareTo: Date, toGranularity: Calendar.Component = .minute) -> ComparisonResult
    * static func getDate(_ dateString: String?, loopCount: Int = 0) -> Date?
    * static func isPast(date: Date) -> Bool
    * func remainingTimer() -> String?

## Thoth+Debug
    * func debugBounds(_ color: UIColor = UIColor.red, _ width: CGFloat = 1)

## Thoth+Dictionary
    * mutating func append(dict: [Key: Value])

## Thoth+Int
    * func withCommas() -> String
    * func withCommas(limit: Int) -> String
    * func toString() -> String

## Thoth+NSMutableAttributedString
    * func addFont(_ fontType: FontWeightType, range: NSRange) -> NSMutableAttributedString
    * func addColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString
    * func attrString() -> NSAttributedString

## Thoth+PHAsset
    * public func getURL(completionHandler: ((_ responseURL: URL?) -> Void)?)
    * public var fileName: String
    * public var fileSize: UInt64
    * public var fileSizeString: String

## Thoth+String
    * var encodedURL: URL?
    * func attributedString(_ lineHeightMultiple: CGFloat) -> NSMutableAttributedString
    * func toInt(value: Int = 0) -> Int
    * func slice(start: String, end: String) -> String?
    * func htmlEscaped(font: UIFont? = nil, colorHex: String = "#000000", lineSpacing: CGFloat = 1.5) -> NSAttributedString
    * func addAttribute(font: UIFont? = nil, color: UIColor? = nil) -> NSAttributedString
    * static func concat(_ attributedStrings: NSAttributedString...) -> NSAttributedString
    * func addAttributes(font: UIFont, color: UIColor) -> NSMutableAttributedString
    * func addLineSpacing(_ lineSpacing: CGFloat) -> NSMutableAttributedString

## Thoth+Time
    * var asDouble: Double
    * var asFloat: Float
    * static func zeroTimeString(_ count: Int = 1) -> String
    * func timeString() -> String

## Thoth+UIAlertController
    * func showAlert(_ message: String, title: String? = nil, confirm: AlertAction? = nil, cancel: AlertAction? = nil, completion: (() -> Void)? = nil)

## Thoth+UIApplication
    * var rootWindow: UIWindow?

## Thoth+UIButton
    * func setBackgroundColor(_ color: UIColor, state: UIControl.State)

## Thoth+UIColor
    * func colorRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor

## Thoth+UIEdgeInsets
    * mutating func setEdgeInset(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0)

## Thoth+UIFont
    * public var monospacedDigitFont: UIFont 

## Thoth+UIImage
    * static func solidImage(_ color: UIColor, size: CGSize = .zero) -> UIImage?

## Thoth+UINavigationBar
    * func setBackgroundColor(_ color: UIColor, titleColor: UIColor = .white)

## Thoth+UIScreen
    * static var size: CGSize
    * static var width: CGFloat
    * static var height: CGFloat

## Thoth+UIStackView
    * func addArrangedSubviews(_ views: UIView...)
    * func removeArrangedSubviews()
    * func addBackground(color: UIColor)
    
## Thoth+UITableViewCell
    * static var reuseIdentifier: String

## Thoth+UITextField
    * func addPadding(_ position: TextFieldPaddingPosition, _ width: CGFloat = 0)
    * func setPlaceholder(_ title: String, color: UIColor, font: UIFont? = nil)

## Thoth+UITextView
    * func addPadding(_ position: TextFieldPaddingPosition, _ width: CGFloat = 0)
    * func setPlaceholder(_ title: String, color: UIColor, font: UIFont? = nil)

## Thoth+UIView
    * func addSubviews(_ subviews: UIView...)
    * func removeSubviews()
    * func fadeInOut(willShow: Bool = true, _ duration: TimeInterval = 0.25)

## Thoth+UIViewController
    * func addChildVC(_ childController: UIViewController)
    * func removeChildVC()

## Thoth+UIWindow
    * var statusBarHeight: CGFloat
    * static var currentOrientation: UIInterfaceOrientation

## Thoth+URL


## Thoth+WKWebView
    * static func setCookie(name: String?, value: String?, domain: String = ".sample.com", path: String = "/", version: String = "1", expires: Date? = nil, webView: WKWebView? = nil)
    * static func printCookie(_ webView: WKWebView?)
    * static func printCookieDataStore(_ dataStore: WKHTTPCookieStore, header: String)

