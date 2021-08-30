//
//  ContentView.swift
//  WeSplit
//
//  Created by Raul on 11/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2

    let tipPercentages = [10, 15, 20, 25, 0]

    var isCheap: Bool{
        let tipSelection = Double(tipPercentages[tipPercentage])
        if tipSelection == 0{
            return true
        }
        else {
            return false
        }
    }

    var totalPrice: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let totalPrice = orderAmount + tipValue

        return totalPrice
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

        var body: some View {
            NavigationView{
                Form {
                    Section {
                        TextField("Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)

                        TextField("Number of people", value: $numberOfPeople, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        }

                    Section(header: Text ("How much tip do you want to leave?")) {
                        Picker ("Tip percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count){
                                Text ("\(self.tipPercentages[$0])%")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    Section (header: Text("Total amount")){
                        Text ("$\(totalPrice, specifier: "%.2f")")
                            .foregroundColor( isCheap ? .red : .black )
                    }

                    Section(header: Text("Amount per person")){
                        Text("$\(totalPerPerson, specifier: "%.2f") ")
                    }
                }
                .navigationBarTitle("WeSplit")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
