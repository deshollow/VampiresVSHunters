//
//  TimerView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 21.01.2024.
//

import SwiftUI

struct TimerView: View {
    
    @State private var timerSettings = TimerSettings(initialSelectedTime: nil)
    @State private var selectedTime = 0
    @State private var mainTime = 3
    
    var body: some View {
        VStack {
            Text("Настройте таймер игры:")
                .foregroundStyle(Color(.black).opacity(0.8))
            Picker("Время таймера", selection: $mainTime) {
                ForEach(1..<31, id: \.self) {
                    Text("\($0) мин").tag($0)
                }
            }.pickerStyle(WheelPickerStyle())
                .frame(width: 300, height: 300)
            Button("Сохранить") {
                selectedTime = mainTime
                timerSettings.saveSettings(time: selectedTime, forKey: "timerSettings")
            }
            .font(.title)
            .foregroundColor(.blue)
            .padding(.bottom, 100)
        }
        .onAppear {
            mainTime = timerSettings.loadSettings(forKey: "timerSettings")!
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButtonView()
            }
        }
    }
}

#Preview {
    TimerView()
}
