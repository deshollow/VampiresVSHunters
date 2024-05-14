//
//  TimerView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 21.01.2024.
//

import SwiftUI

struct TimerView: View {

    @StateObject var timerSettings = TimerSettings(initialSelectedTime: nil)

    var body: some View {
            VStack {
                Text("Настройте таймер игры:")
                    .foregroundStyle(Color(.black).opacity(0.8))
                Picker("Время таймера", selection: $timerSettings.selectedTime) {
                    ForEach(1..<31, id: \.self) {
                        Text("\($0) мин").tag($0)
                    }
                }.pickerStyle(WheelPickerStyle())
                    .frame(width: 300, height: 300)
                Button("Сохранить") {
                    timerSettings.updateSelectedTime(forKey: "timerSettings")
                }
                .font(.title)
                .foregroundColor(.blue)
                .padding(.bottom, 100)
                .onAppear {
                    timerSettings.loadSettings(forKey: "timerSettings")
                }
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
    
    //I - застрял на сохранении пикера
    
    //import SwiftUI
    //
    //struct TimerView: View {
    //
    //    @State var timerSettings = TimerSettings(initialSelectedTime: nil)
    //
    //    @State var selectedTime = 0
    //    @State var mainTime = 3
    //
    //    var body: some View {
    //            VStack {
    //                Text("Настройте таймер игры:")
    //                    .foregroundStyle(Color(.black).opacity(0.8))
    //                Picker("Время таймера", selection: $mainTime) {
    //                    ForEach(1..<31, id: \.self) {
    //                        Text("\($0) мин").tag($0)
    //                    }
    //                }.pickerStyle(WheelPickerStyle())
    //                    .frame(width: 300, height: 300)
    //                Button("Сохранить") {
    //                    selectedTime = mainTime
    //                    timerSettings.saveSettings(time: selectedTime, forKey: "timerSettings")
    //                    mainTime = timerSettings.loadSettings(forKey: "timerSettings")!
    //                }
    //                .font(.title)
    //                .foregroundColor(.blue)
    //                .padding(.bottom, 100)
    //            }
    //            .frame(maxWidth: .infinity, maxHeight: .infinity)
    //            .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    //            .navigationBarBackButtonHidden(true)
    //            .toolbar {
    //                ToolbarItem(placement: .navigationBarLeading) {
    //                    CustomBackButtonView()
    //                }
    //            }
    //        }
    //    }
    //
    //#Preview {
    //    TimerView()
    //}
    
    //II StackOver - способ через AppStorage - работает но странный
    
    //If you use @AppStorage instead you can skip the extra class.
    //
    //In the view add this property
    //
    //@AppStorage("timerSettings") private var timerSettings = 3
    //Note that 3 is the default value used if nothing is stored yet in UserDefaults
    //
    //And then use this property instead in your view (I removed most of the view modifiers for clarity)
    //
    //struct TimerView: View {
    //    @AppStorage("timerSettings") private var timerSettings = 3
    //
    //    var body: some View {
    //        VStack {
    //            Text("Change time:")
    //                .foregroundStyle(Color(.black).opacity(0.8))
    //            Picker("Timer", selection: $timerSettings) {
    //                ForEach(1..<31, id: \.self) {
    //                    Text("\($0) min").tag($0)
    //                }
    //            }.pickerStyle(WheelPickerStyle())
    //        }
    //    }
    //}
    
    //III Спосб с UserDefaults
    
    //class TimerSettings: ObservableObject {
    //
    //    @Published var selectedTime: Int?
    //
    //    init(initialSelectedTime: Int?) {
    //        self.selectedTime = initialSelectedTime
    //    }
    //    func updateSelectedTime(forKey: String) {
    //        UserDefaults.standard.set(selectedTime, forKey: forKey)
    //        print(time)
    //    }
    //    func loadSettings(forKey: String) {
    //        if let savedSettings = UserDefaults.standard.object(forKey: forKey) as? Int {
    //            selectedTime = savedSettings
    //            return savedSettings
    //        }
    //        selectedTime = 3
    //    }
    //}
    //
    //struct TimerView: View {
    //
    //    @StateObject var timerSettings = TimerSettings(initialSelectedTime: nil)
    //
    //    var body: some View {
    //        VStack {
    //            Text("Настройте таймер игры:")
    //                .foregroundStyle(Color(.black).opacity(0.8))
    //            Picker("Время таймера", selection: $timerSettings.selectedTime) {
    //                ForEach(1..<31, id: \.self) {
    //                    Text("\($0) мин").tag($0)
    //                }
    //            }.pickerStyle(WheelPickerStyle())
    //                .frame(width: 300, height: 300)
    //            Button("Сохранить") {
    //
    //                timerSettings.updateSelectedTime(forKey: "timerSettings")
    //
    //            }
    //            .font(.title)
    //            .foregroundColor(.blue)
    //            .padding(.bottom, 100)
    //            .onAppear {
    //                timerSettings.loadSettings(forKey: "timerSettings")
    //            }
    //        }
    //        .frame(maxWidth: .infinity, maxHeight: .infinity)
    //        .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    //        .navigationBarBackButtonHidden(true)
    //        .toolbar {
    //            ToolbarItem(placement: .navigationBarLeading) {
    //                CustomBackButtonView()
    //            }
    //        }
    //    }
    //}
    
    //IV
    //
    //import SwiftUI
    //
    //struct TimerView: View {
    //
    //    @StateObject var timerSettings = TimerSettings(initialSelectedTime: nil)
    //
    //    var body: some View {
    //            VStack {
    //                Text("Настройте таймер игры:")
    //                    .foregroundStyle(Color(.black).opacity(0.8))
    //                Picker("Время таймера", selection: $timerSettings.selectedTime) {
    //                    ForEach(1..<31, id: \.self) {
    //                        Text("\($0) мин").tag($0)
    //                    }
    //                }.pickerStyle(WheelPickerStyle())
    //                    .frame(width: 300, height: 300)
    //                Button("Сохранить") {
    //                    timerSettings.updateSelectedTime(forKey: "timerSettings")
    //                }
    //                .font(.title)
    //                .foregroundColor(.blue)
    //                .padding(.bottom, 100)
    //                .onAppear {
    //                    timerSettings.loadSettings(forKey: "timerSettings")
    //                }
    //            }
    //            .frame(maxWidth: .infinity, maxHeight: .infinity)
    //            .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    //            .navigationBarBackButtonHidden(true)
    //            .toolbar {
    //                ToolbarItem(placement: .navigationBarLeading) {
    //                    CustomBackButtonView()
    //                }
    //            }
    //        }
    //    }
    //
    //#Preview {
    //    TimerView()
    //}
    
    //V
    
    //import SwiftUI
    //
    //struct TimerView: View {
    //
    //    @AppStorage("timerSettings") private var timerSettings = 3
    //
    //    var body: some View {
    //        VStack {
    //            Text("Настройте таймер игры:")
    //                .foregroundStyle(Color(.black).opacity(0.8))
    //            Picker("Время таймера", selection: $timerSettings) {
    //                ForEach(1..<31, id: \.self) {
    //                    Text("\($0) мин").tag($0)
    //                }
    //            }.pickerStyle(WheelPickerStyle())
    //                .frame(width: 300, height: 300)
    //            //                Button("Сохранить") {
    //            //                    timerSettings.updateSelectedTime(forKey: "timerSettings")
    //            //                }
    //            //                .font(.title)
    //            //                .foregroundColor(.blue)
    //            //                .padding(.bottom, 100)
    //            //                .onAppear {
    //            //                    timerSettings.loadSettings(forKey: "timerSettings")
    //        }
    //        .frame(maxWidth: .infinity, maxHeight: .infinity)
    //        .background(Color(#colorLiteral(red:0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    //        .navigationBarBackButtonHidden(true)
    //        .toolbar {
    //            ToolbarItem(placement: .navigationBarLeading) {
    //                CustomBackButtonView()
    //            }
    //        }
    //    }
    //}
    //
    //#Preview {
    //    TimerView()
    //}
