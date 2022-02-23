//
//  Thoth+Dictionary.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import Foundation

extension Dictionary {
    
    mutating func append(dict: [Key: Value]) {
        for (key, value) in dict {
            updateValue(value, forKey: key)
        }
    }
}
