//
//  ClockTickingAnimation.swift
//  MagicalAnimation-SwiftUI
//
//  Created by Abdul Sami Sultan on 26/09/2023.
//

import SwiftUI

struct ClockTickingAnimation: View {
    
    @State var animationAngleSeconds = 0
    @State var animationAngleMinutes = 40
    @State var animationAngleHours = -50
    @State var seconds = 1.0
    @State var minutes = 60.0
    @State var hours = 360.0
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 10))
                .foregroundColor(.black)
                .padding()
            SecondsHand()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .rotationEffect(.init(degrees: Double(animationAngleSeconds)))
            MinutesHand()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .rotationEffect(.init(degrees: Double(animationAngleMinutes)))
            HoursHand()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .rotationEffect(.init(degrees: Double(animationAngleHours)))
        }.onAppear{
            Timer.scheduledTimer(withTimeInterval: seconds, repeats: true) { _ in
                self.animationAngleSeconds += 1
            }
            Timer.scheduledTimer(withTimeInterval: minutes, repeats: true) { _ in
                self.animationAngleMinutes += 1
            }
            Timer.scheduledTimer(withTimeInterval: hours, repeats: true) { _ in
                self.animationAngleHours += 1
            }
        }
    }
}
struct SecondsHand: Shape {
    func path(in rect:CGRect) -> Path{
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX,y:rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 200))
        return path
    }
    
}
struct MinutesHand: Shape {
    func path(in rect:CGRect) -> Path{
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX,y:rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 230))
        return path
    }
    
}
struct HoursHand: Shape {
    func path(in rect:CGRect) -> Path{
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX,y:rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 280))
        return path
    }
    
}

struct ClockTickingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ClockTickingAnimation()
    }
}
