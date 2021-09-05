//
//  ContentView.swift
//  BetterRest
//
//  Created by Raul on 31/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    var body: some View {
        NavigationView{
            VStack{
                Text("How many hours do you want to sleep?")
                    .font(.headline)
                Stepper(value: $sleepAmount, in: 3...14, step: 0.25) {
                    Text ("\(sleepAmount, specifier: "%g") hours")
                }
                .padding()
                DatePicker ("Please enter a time:", selection: $wakeUp, in: Date()...,
                            displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
            }
            .padding()
        }

    }
}

func buildFormater() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let dateString = formatter.string(from: Date())
    return dateString
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
