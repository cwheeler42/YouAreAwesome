//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Chris Wheeler on 2/12/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber = -1

    @State private var audioPlayer: AVAudioPlayer!

    let imagePrefixString = "moveInWeekend - "
    let numberOfImages = 10
    let soundPrefixString = "sound"
    let numberOfSounds = 6
    
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

            Spacer()
            
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
                print("Displaying message number \(messageNumber)")

                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 1...numberOfImages)
                } while imageNumber == lastImageNumber
                lastImageNumber = imageNumber
                imageName = "\(imagePrefixString)\(imageNumber)"
                print("Displaying image number \(imageNumber)")

                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...numberOfSounds-1)
                } while soundNumber == lastSoundNumber
                print("Playing sound number \(soundNumber)")
                lastSoundNumber = soundNumber
                guard let soundFile = NSDataAsset(name: "\(soundPrefixString)\(soundNumber)") else {
                    return print("‼️ Could not read file \(soundPrefixString)\(soundNumber)")
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("‼️ ERROR: \(error.localizedDescription) creating audio player")
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
