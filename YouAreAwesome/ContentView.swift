//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Wheeler on 2/12/25.
//

import SwiftUI

struct ContentView: View {

    @State private var message = "I Am A Programmer!"

    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .padding()
            Text("\(message)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.red)
            Button("Click Me!") {
                message = "Awesome!"
            }
        }
        .padding()

    }
}

#Preview {
    ContentView()
}
