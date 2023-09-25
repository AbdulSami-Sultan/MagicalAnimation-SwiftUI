//
//  ContentView.swift
//  MagicalAnimation-SwiftUI
//
//  Created by Abdul Sami Sultan on 25/09/2023.
//

import SwiftUI

struct Home: View {

    
    let animationList = [
            "Waves Animation",
            "Pulse"
        ]
    
    var body: some View {
        
        NavigationStack {
            List(animationList, id: \.self) { animation in
                if animation == "Waves Animation"{
                    NavigationLink(animation) {
                        WavesAnimation()
                    }
                }else{
                    NavigationLink(animation, value: animation)
                }
                
            }
            .navigationTitle("Select a Animation")
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
