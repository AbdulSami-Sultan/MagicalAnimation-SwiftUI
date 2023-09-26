//
//  ContentView.swift
//  MagicalAnimation-SwiftUI
//
//  Created by Abdul Sami Sultan on 25/09/2023.
//

import SwiftUI

struct Home: View {

    
    let animationList = [
            "Waves",
            "Pulse",
            "Clock Ticking"
        ]
    
    var body: some View {
        
        NavigationStack {
            List(animationList, id: \.self) { animation in
                switch animation{
                case "Waves":
                    NavigationLink(animation) { WavesAnimation() }
                case "Pulse":
                    NavigationLink(animation) { Pulse() }
                case "Clock Ticking":
                    NavigationLink(animation) { ClockTickingAnimation() }
                default:
                    NavigationLink(animation) { Pulse() }
                }
            }
            .navigationTitle("Select Animation")
        }

        
    }
    
    enum AnimationList: String, CaseIterable{
        case Waves, Pulse
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
