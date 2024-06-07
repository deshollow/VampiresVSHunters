//
//  TimerModel.swift
//  VampiresVSHunters
//
//  Created by deshollow on 16.02.2024.
//

import SwiftUI
import Combine

class TimerSettings: ObservableObject {

    @Published var selectedTime: Int?

    init(initialSelectedTime: Int?) {
        self.selectedTime = initialSelectedTime
    }
    //save method
    func saveSettings(time: Int, forKey: String) {
        UserDefaults.standard.set(time, forKey: forKey)
        print(time)
    }
    //load method
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

