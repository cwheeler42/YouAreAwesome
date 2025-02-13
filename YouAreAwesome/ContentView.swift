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
    
    let message1: String = "You Are Awesome!"
    let message2: String = "You Are Great!"

    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .padding()
            
            Text("\(message)")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            Button("Press Me!") {
                if message == message1 {
                    message = message2
                    imageName = "hand.thumbsup"
                }
                else {
                    message = message1
                    imageName = "sun.max.fill"
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
