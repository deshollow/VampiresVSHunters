//
//  TimerModel.swift
//  VampiresVSHunters
//
//  Created by deshollow on 16.02.2024.
//

//import SwiftUI
//import Combine
//
//class TimerSettings: ObservableObject {
//    
//    @Published var selectedTime: Int?
//    
//    init(initialSelectedTime: Int?) {
//        self.selectedTime = initialSelectedTime
//    }
//    func updateSelectedTime(forKey: String) {
//        UserDefaults.standard.set(selectedTime, forKey: forKey)
////        print(selectedTime)
//    }
//    func loadSettings(forKey: String) {
//        if let savedSettings = UserDefaults.standard.object(forKey: forKey) as? Int {
//            selectedTime = savedSettings
//        }
//        selectedTime = 3
//    }
//}

//I - класс нужен, если использую UserDefaults и не нужен если AppStorage

import SwiftUI
import Combine

class TimerSettings: ObservableObject {

    @Published var selectedTime: Int?

    init(initialSelectedTime: Int?) {
        self.selectedTime = initialSelectedTime
    }
    //униварсальная функция сохранения
    func saveSettings(time: Int, forKey: String) {
        UserDefaults.standard.set(time, forKey: forKey)
        print(time)
    }
    //универсальная функция загрузки
    func loadSettings(forKey: String) -> Int? {
        if let savedSettings = UserDefaults.standard.object(forKey: forKey) as? Int {
            selectedTime = savedSettings
            return savedSettings
        } else {
            selectedTime = nil
            return nil
        }
    }
}

//II

//
//import SwiftUI
//import Combine
//
//class TimerSettings: ObservableObject {
//
//    @Published var selectedTime: Int?
//
//    init(initialSelectedTime: Int?) {
//        self.selectedTime = initialSelectedTime
//    }
//    func updateSelectedTime(forKey: String) {
//        UserDefaults.standard.set(selectedTime, forKey: forKey)
//    }
//    func loadSettings(forKey: String) -> Int? {
//        if let savedSettings = UserDefaults.standard.object(forKey: forKey) as? Int {
//            selectedTime = savedSettings
//             return savedSettings
//        }
//        selectedTime = 3
//         return selectedTime
//    }
//}

