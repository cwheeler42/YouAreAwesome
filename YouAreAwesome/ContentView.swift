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

    @State private var soundIsOn = true

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
            
            HStack {
                Text("Sound On:")
                    .font(.title3)
                Toggle("Sound On:", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { oldValue, newValue in
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                    .tint(.accentColor)
                
                Spacer()
                
                Button("Press Me!") {
                    let messages = ["You are Awesome!",
                                    "You are Great!",
                                    "You are Magical!",
                                    "When the Genius Bar Needs Help, They Call You!",
                                    "Please Stop Chanting!"]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, lowerBound: 0, upperBound: messages.count-1)
                    message = messages[lastMessageNumber]
                    print("Displaying message number \(lastMessageNumber)")
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, lowerBound: 1, upperBound: numberOfImages)
                    imageName = "\(imagePrefixString)\(lastImageNumber)"
                    print("Displaying image number \(lastImageNumber)")
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, lowerBound: 0, upperBound: numberOfSounds-1)
                    print("Playing sound number \(lastSoundNumber)")
                    
                    if soundIsOn {
                        playSound(soundName: "\(soundPrefixString)\(lastSoundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.accentColor)

            }
            
        }
        .padding()
        
    }
    
    func nonRepeatingRandom(lastNumber: Int, lowerBound: Int, upperBound: Int) -> Int
    {
        var randomNumber: Int
        repeat {
            randomNumber = Int.random(in: lowerBound...upperBound)
        } while randomNumber == lastNumber
        return randomNumber
    }
    
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }

        guard let soundFile = NSDataAsset(name: soundName) else {
            return print("‼️ Could not read file \(soundName)")
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("‼️ ERROR: \(error.localizedDescription) creating audio player")
        }
    }
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
