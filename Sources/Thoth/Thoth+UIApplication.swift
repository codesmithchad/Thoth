//
//  Thoth+UIApplication.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import UIKit

extension UIApplication {
    var rootWindow: UIWindow? {
//        var scenes: Set<UIScene> = UIApplication.shared.connectedScenes
//            .filter({$0.activationState == .foregroundActive})
//        if scenes.count == 0 {
//            scenes = UIApplication.shared.connectedScenes
//                .filter({$0.activationState == .foregroundInactive})
//        }
//        return scenes
//            .map({$0 as? UIWindowScene})
//            .compactMap({$0})
//            .first?.windows
//            .filter({$0.isKeyWindow}).first
        return UIApplication.shared.windows.filter({$0.isKeyWindow}).first
    }
}
