//
//  WavesAnimation.swift
//  MagicalAnimation-SwiftUI
//
//  Created by Abdul Sami Sultan on 25/09/2023.
//

import SwiftUI

struct WavesAnimation: View {
    @State var toggle = false
    
    var body: some View {
        ZStack{
            Waves(color: .cyan.opacity(0.5), amplify: 150, isReversed: false)
            Waves(color: (toggle ? Color.purple : Color.cyan).opacity(0.4), amplify: 140, isReversed: true)
            
            VStack{
                HStack{
                    Text("Wavs's").font(.largeTitle.bold())
                    Spacer()
                    Toggle(isOn: $toggle) {
                        Image(systemName: "eyedropper.halffull").font(.title2)
                    }
                    .toggleStyle(.button)
                    .tint(.purple)
                }
            }
            .padding()
            .frame(maxHeight: .infinity,alignment: .top)
            
        }.ignoresSafeArea(.all,edges: .bottom)
    }
    
    
}
struct WavesAnimation_Previews: PreviewProvider {
    static var previews: some View {
        WavesAnimation()
    }
}

struct Waves: View {
    var color: Color
    var amplify: CGFloat
    
    var isReversed : Bool
    
    var body: some View {
        TimelineView(.animation) { timeLine in
            Canvas{context, size in
                let timeNow = timeLine.date.timeIntervalSinceReferenceDate
                
                let angle = timeNow.remainder(dividingBy: 2)
                let offSet = angle * size.width
                
                context.translateBy(x: isReversed ? -offSet : offSet, y: 0)
                
                context.fill(getPath(size: size), with: .color(color))
                context.translateBy(x: -size.width, y: 0)
                
                context.fill(getPath(size: size), with: .color(color))
                context.translateBy(x: size.width * 2, y: 0)
                
                context.fill(getPath(size: size), with: .color(color))
            }
        }
    }
    
    func getPath(size:CGSize)->Path{
        return Path{ path in
            
            let midHeight = size.height / 2
            let width = size.width
            path.move(to: CGPoint(x:0,y:midHeight))
            path.addCurve(to: CGPoint(x: width, y: midHeight),
                          control1: CGPoint(x: width * 0.4, y: midHeight + amplify),
                          control2: CGPoint(x: width * 0.65, y: midHeight - amplify))
            
            path.addLine(to: CGPoint(x: width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            
            
            
        }
        
        
    }
}
