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
                Text("When do you want to wake up?")
                    .font(.headline)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
