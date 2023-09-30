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
            "Clock Ticking",
            "Disk Loading",
            "Sticky Headers"
        ]
    
    var body: some View {
        
        if #available(iOS 16.0, *) {
            NavigationStack {
                List(animationList, id: \.self) { animation in
                    switch animation{
                    case "Waves":
                        NavigationLink(animation) { WavesAnimation() }
                    case "Pulse":
                        NavigationLink(animation) { Pulse() }
                    case "Clock Ticking":
                        NavigationLink(animation) { ClockTickingAnimation() }
                    case "Disk Loading":
                        NavigationLink(animation) { DisLoading() }
                    case "Sticky Headers":
                        NavigationLink(animation) { StickyHeader() }
                    default:
                        NavigationLink(animation) { Pulse() }
                    }
                }
                .navigationTitle("Select Animation")
            }
        } else {
            // Fallback on earlier versions
            NavigationView{
                List(animationList, id: \.self) { animation in
                    switch animation{
                    case "Waves":
                        NavigationLink(animation) { WavesAnimation() }
                    case "Pulse":
                        NavigationLink(animation) { Pulse() }
                    case "Clock Ticking":
                        NavigationLink(animation) { ClockTickingAnimation() }
                    case "Disk Loading":
                        NavigationLink(animation) { DisLoading() }
                    case "Sticky Headers":
                        NavigationLink(animation) { StickyHeader() }
                    default:
                        NavigationLink(animation) { Pulse() }
                    }
                }
                .navigationTitle("Select Animation")
            }
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
