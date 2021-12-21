//
//  Thoth+Date.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import Foundation

extension Date {

    @inlinable public static var localDate: Date {
        Date(timeInterval: TimeInterval(Calendar.current.timeZone.secondsFromGMT()), since: Date())
    }

    @inlinable public static var nowUTC: String {
        Date().toStringUTC(dateFormat: "yyyy-MM-dd'T'HH:mm:ss'Z'")
    }

    @inlinable public func toString(dateFormat format: String, timeZoneValue: TimeZone?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZoneValue ?? TimeZone.autoupdatingCurrent
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }

    @inlinable
    public func toString(dateFormat format: String, timeZone: String? = nil) -> String {
        if let timeZone = timeZone {
            return toString(dateFormat: format, timeZoneValue: TimeZone(abbreviation: timeZone))
        }
        return toString(dateFormat: format, timeZoneValue: TimeZone.autoupdatingCurrent)
    }

    @inlinable
    public func toStringKST(dateFormat format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        toString(dateFormat: format, timeZone: nil)
    }

    @inlinable
    public func toStringUTC(dateFormat format: String) -> String {
        toString(dateFormat: format, timeZone: "UTC")
    }

    @inlinable
    public func getCompare(compareTo: Date, toGranularity: Calendar.Component = .minute) -> ComparisonResult {
        return Calendar.current.compare(self, to: compareTo, toGranularity: toGranularity)
    }

//    @inlinable
//    public func getDateString(_ year: Bool = false) -> String {
//        let global = CommonDef.isGlobalLanguage
//        // TODO: 서버에서 고정 피드에 내년 생성일자로 내려줘서 년도 표시를 임시로 막음
////        if year {
////            return toString(dateFormat: global ? "MMM dd'th', yyyy" : "yyyy년 MM월 dd일")
////        }
//        return toString(dateFormat: global ? "MMM dd'th'" : "MM월 dd일")
//    }

//    @inlinable
//    public static func getChatDate(text: String, format: String = "yyyy/MM/dd") -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format
//        return dateFormatter.date(from: text)?
//            .toString(dateFormat: CommonDef.isGlobalLanguage ? "MMM d'th', yyyy" : "yyyy년 M월 d일") ?? text
//    }

//    @inlinable
//    public func getTimeString() -> String {
//        let global = CommonDef.isGlobalLanguage
//        return toString(dateFormat: global ? "h:mm a" : "a h:mm")
//    }

//    @inlinable
//    public static func getCompareString(_ compareTo: Date, toGranularity: Calendar.Component = .day, todayNone: Bool = false) -> String {
//        let global = CommonDef.isGlobalLanguage
//        let calendar = NSCalendar.current
//
//        switch toGranularity {
//        case .day:
//            if calendar.isDateInToday(compareTo) {
//                return todayNone ? "" : (global ? "Today" : "오늘")
//            } else if calendar.isDateInYesterday(compareTo) {
//                return global ? "Yesterday" : "어제"
//            } else if calendar.isDateInTomorrow(compareTo) {
//                return global ? "Tomorrow" : "내일"
//            }
//            let isSameYear = calendar.isDate(Date(), equalTo: compareTo, toGranularity: .year)
//            return compareTo.getDateString(!isSameYear)
//        default:
//            break
//        }
//        return "none"
//    }

    @inlinable
    public static func getDate(_ dateString: String?, loopCount: Int = 0) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        if loopCount > 0 {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.\(String(repeating: "S", count: loopCount))'Z'"
        }
//        printLog("getDate dateString[\(dateString)] loopCount[\(loopCount)] dateFormat [\(String(describing: dateFormatter.dateFormat))]")
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        guard let wrapDateString = dateString, let date: Date = dateFormatter.date(from: wrapDateString) else {
            guard loopCount < 3 else { return nil }
            return getDate(dateString, loopCount: loopCount + 1)
        }
        return date
    }

//    @inlinable
//    public static func getNowPassString(_ dateString: String?) -> String {
//        let global = CommonDef.isGlobalLanguage
//        guard let date = getDate(dateString) else {
//            printLog("getNowPassString error dateString [\(String(describing: dateString))]")
//            return global ? "error" : "에러"
//        }
//        let calendar = Calendar.current
//        let now = Date()
//
//        let isPast = date.compare(now) != .orderedDescending
//        if isPast {
//            if calendar.isDateInToday(date) {
//                let interval = calendar.dateComponents([.minute, .hour], from: date, to: now)
//                if let hour = interval.hour {
//                    if hour == 0, let minute = interval.minute {
//                        let minute = (minute / 10) * 10
//                        if minute == 0 {
//                            return global ? "Just now" : "방금"
//                        }
//                        return global ? "\(minute)m ago" : "\(minute)분 전"
//                    }
//                    return global ? "\(hour)h ago" : "\(hour)시간 전"
//                }
//            } else if calendar.isDateInYesterday(date) {
//                return global ? "Yesterday" : "어제"
//            }
//        } else {
//            if calendar.isDateInToday(date) {
//                return global ? "Today" : "오늘"
//            } else if calendar.isDateInTomorrow(date) {
//                return global ? "Tomorrow" : "내일"
//            }
//        }
//        let isSameYear = calendar.isDate(now, equalTo: date, toGranularity: .year)
//        return date.getDateString(!isSameYear)
//    }

    @inlinable
    public static func isPast(date: Date) -> Bool {
        return date.compare(Date()) == .orderedAscending
    }
}

extension Date {
    @inlinable
    public func remainingTimer() -> String? {
        let now = Date()
        let elapsedTime = self.timeIntervalSince(now)
        let hours = floor(elapsedTime / 60 / 60)
        let minutes = String(format: "%02d", Int((elapsedTime - (hours * 60 * 60)) / 60))
        let seconds = String(format: "%02d", Int(elapsedTime)  % 60)
        let milliseconds = String(format: "%02d", Int(elapsedTime * 100) % 100)
        if elapsedTime >= 0 {
            return "\(minutes) : \(seconds).\(milliseconds)"
        } else {
            return nil
        }
    }
}
