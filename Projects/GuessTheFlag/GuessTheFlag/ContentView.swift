//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Raul on 20/5/21.
//

import SwiftUI

struct ImageModifier: ViewModifier {
    func body (content: Content) -> some View{
        content
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(
                    Color .black,
                    lineWidth: 1
                )
            )
            .shadow(color: Color.black, radius: 2)
    }
}

extension View {
    func imageStyle() -> some View {
        self.modifier(ImageModifier())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScoreCorrect = false
    @State private var showingScoreWrong = false
    @State private var scoreTitle = ""
    @State private var scoreNumber = 0
    @State private var selectedCountry = 0

    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(
                    colors: [.blue, .black]
                ),
                startPoint: .top, endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)

            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .alert(isPresented: $showingScoreCorrect) {
                            Alert(
                                title: Text (scoreTitle),
                                message: Text (
                                    "Your score is: \(scoreNumber) "
                                ),
                                dismissButton: .default(
                                    Text (
                                        "Continue"
                                    )
                                ){
                                self.askQuestion()
                            })
                        }
                }
                ForEach(0..<3) { number in
                    Button (action: {
                        self.flagTapped(number)
                        
                    })
                    {
                        Image(
                            self.countries[number]
                        )
                        .imageStyle()
                        .alert(isPresented: $showingScoreWrong) {
                            Alert(
                                title: Text (scoreTitle),
                                message: Text (
                                    "You selected \(countries[selectedCountry]) "
                                ),
                                dismissButton: .default(
                                    Text (
                                        "Reset"
                                    )
                                ){
                                self.askQuestion()
                            })
                        }
                    }
                }
                Text ("Your current score is \(scoreNumber)")
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }

    func flagTapped (_ number : Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreNumber += 1
            showingScoreCorrect = true
            selectedCountry = number

        } else {
            scoreTitle = "Wrong"
            scoreNumber = 0
            showingScoreWrong = true
            selectedCountry = number

        }
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
