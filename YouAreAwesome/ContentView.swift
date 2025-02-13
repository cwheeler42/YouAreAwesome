//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Wheeler on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageNumber = 1
    @State private var messageNumber = 0

    let imagePrefixString = "moveInWeekend - "
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image("\(imagePrefixString)\(imageNumber)")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 15)
                .padding()
            
            Text("\(message)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Press Me!") {
                let messages = ["You are Awesome!",
                                "You are Great!",
                                "You are Magical!",
                                "You are a Really Long Text String!",
                                "Stop Chanting!"]
                
                message = messages[messageNumber]
                messageNumber += 1

                if messageNumber >= messages.count {
                    messageNumber = 0
                }

                imageNumber += 1
                if imageNumber > 10 {
                    imageNumber = 1
                }
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
