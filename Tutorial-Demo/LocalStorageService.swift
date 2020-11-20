//
//  LocalStorageService.swift
//  Tutorial-Demo
//
//  Created by 劉 天宇 on 2020/11/20.
//

import Foundation

class LocalStorageService {
    
    static func saveStartNumber(number: Int) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(number, forKey: "number")
    }
    
    static func loadStartNumber() -> Int? {
        
        let defaults = UserDefaults.standard
        
        let number = defaults.value(forKey: "number") as? Int
        
        return number
    }
}
