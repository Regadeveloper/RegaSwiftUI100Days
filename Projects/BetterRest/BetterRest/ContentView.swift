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
                    .padding(.top)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Stepper(value: $sleepAmount, in: 3...14, step: 0.25) {
                    Text ("\(sleepAmount, specifier: "%g") hours")
                }
                .padding()

                Text ("At what time do you want to wake up?")
                    .font(.headline)
                    .padding(.top)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                DatePicker ("Please enter a time:", selection: $wakeUp, in: Date()...,
                            displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()

                Text ("Daily coffee intake:")
                    .font(.headline)
                    .padding(.top)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Stepper(value: $coffeeAmount, in: 0...12, step: 1 ) {
                    if coffeeAmount == 1 {
                        Text ("1 cup")
                    }
                    else {
                        Text ("\(coffeeAmount) cups")
                    }
                }
                .padding()
                Spacer()
            }
            .padding()
            .navigationBarTitle("BetterRest")
            .navigationBarItems(
            trailing:
                Button(action: calculateBedtime){
                    Text("Calculate")
                }
            )
        }
    }
    func calculateBedtime(){

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
