//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Wheeler on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1

    let imagePrefixString = "moveInWeekend - "
    
    var body: some View {
        
        VStack {
            
            Text("\(message)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 100)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.15), value: message)

            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 15)
                .padding()
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Press Me!") {
                let messages = ["You are Awesome!",
                                "You are Great!",
                                "You are Magical!",
                                "You are a Really Really Long Text String to Fit Here!",
                                "Stop Chanting!"]

                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 1...messages.count) - 1
                } while messageNumber == lastMessageNumber
                lastMessageNumber = messageNumber
                message = messages[messageNumber]
                print(messageNumber)

                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 1...10)
                } while imageNumber == lastImageNumber
                lastImageNumber = imageNumber
                imageName = "\(imagePrefixString)\(imageNumber)"
                print(imageNumber)

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
