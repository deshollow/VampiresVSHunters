//
//  TimerView.swift
//  VampiresVSHunters
//
//  Created by deshollow on 21.01.2024.
//

import SwiftUI

struct TimerView: View {
    
    @State var selectedTime = 2
    let times = Array(1...30)
    
    var body: some View {
            VStack {
                Text("Настройте таймер игры:")
                    .foregroundStyle(Color(.black).opacity(0.8))
                Picker("Настройте таймер игры:", selection: $selectedTime) {
                    ForEach(0 ..< times.count, id: \.self) {
                        Text("\(self.times[$0]) мин").tag($0)
                    }
                }.pickerStyle(WheelPickerStyle())
                    .frame(width: 300, height: 300)
                Button("Сохранить") {
                    
                }
                .font(.title)
                .foregroundColor(.blue)
                .padding(.bottom, 100)
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

//Для сохранения выбранного значения таймера вы можете использовать @ObservableObject и @Published свойства. Создайте класс TimerManager с @Published свойством для выбранного значения таймера. Затем добавьте этот класс как параметр в View где отображается таймер и в другом View, где вы хотите отобразить выбранное значение таймера. В этом втором View добавьте Text с Binding к свойству выбранного значения таймера из TimerManager.

//Также вам нужно будет добавить TimerManager как параметр в оба ваших View. В View, где отображается таймер, вы будете использовать его для привязки к selectedTime и сохранения выбранного значения при нажатии на кнопку. В другом View вы будете использовать TimerManager для получения выбранного значения и отображения его в ячейке.
