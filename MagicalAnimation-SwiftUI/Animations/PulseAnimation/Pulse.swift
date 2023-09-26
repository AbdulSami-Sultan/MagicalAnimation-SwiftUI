//
//  Pulse.swift
//  MagicalAnimation-SwiftUI
//
//  Created by Abdul Sami Sultan on 26/09/2023.
//

import SwiftUI

struct Pulse: View {
    var body: some View {
        Loading()
    }
}
struct Loading: View{
    @State var animate = false
    var body: some View {
        ZStack{
            Circle().fill(Color.red.opacity(0.25)).frame(width: 350,height: 350).scaleEffect(self.animate ? 1 : 0)
            Circle().fill(Color.red.opacity(0.35)).frame(width: 250,height: 250).scaleEffect(self.animate ? 1 : 0)
            Circle().fill(Color.red.opacity(0.45)).frame(width: 150,height: 150).scaleEffect(self.animate ? 1 : 0)
            Circle().fill(Color.red).frame(width: 30,height: 30)
                .scaleEffect(self.animate ? 1 : 0)
        }.onAppear{
            self.animate.toggle()
        }
        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true))
    }
}

struct Pulse_Previews: PreviewProvider {
    static var previews: some View {
        Pulse()
    }
}
