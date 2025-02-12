//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Wheeler on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .padding()
            Text("You Are Awesome!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.red)
                
        }
        .padding()

    }
}

#Preview {
    ContentView()
}
