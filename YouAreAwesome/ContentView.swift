//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Wheeler on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = "You Are Awesome!"
    @State private var imageNumber = 1

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
            
            Spacer()
            
            Button("Press Me!") {
                let message0 = "You are Great!"
                let message1 = "You are Awesome!"
                
                message = ( message == message0 ? message1 : message0)

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
