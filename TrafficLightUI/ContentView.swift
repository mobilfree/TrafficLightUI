//
//  ContentView.swift
//  TrafficLightUI
//
//  Created by Artem on 26.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonText = "START"
    @State private var redLamp = FlashLamp(color: .red)
    @State private var yellowLamp = FlashLamp(color: .yellow)
    @State private var greenLamp = FlashLamp(color: .green)
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                redLamp
                yellowLamp
                greenLamp
                Spacer()
                nextButton
            }
            .padding()
        }
    }
    
    private var nextButton: some View {
        Button(action: { buttonPressed() }) {
            Text(buttonText)
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                .font(.title)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 4)
                    )
        }
        .padding()
    }
    
    private func buttonPressed() {
        buttonText = "NEXT"
        
        if redLamp.lightOn {
            redLamp.lightOn = false
            yellowLamp.lightOn = true
        } else if yellowLamp.lightOn {
            yellowLamp.lightOn = false
            greenLamp.lightOn = true
        } else if greenLamp.lightOn {
            greenLamp.lightOn = false
            redLamp.lightOn = true
        } else {
            redLamp.lightOn = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
