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
                if message == "You Are Awesome!" {
                    message = "You Are Great!"
                    imageName = "hand.thumbsup"
                }
                else {
                    message = "You Are Awesome!"
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
