//
//  DisLoading.swift
//  MagicalAnimation-SwiftUI
//
//  Created by Abdul Sami Sultan on 26/09/2023.
//

import SwiftUI

struct DisLoading: View {
    @State var isMoving = false
    var body: some View {
        ZStack{
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 20, height: 20)
                .rotation3DEffect(.degrees(70), axis: (x: 1, y: 0, z: 0))
                .offset(y: isMoving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true), value: isMoving)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 50, height: 50)
                .rotation3DEffect(.degrees(70), axis: (x: 1, y: 0, z: 0))
                .offset(y: isMoving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.05), value: isMoving)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 80, height: 80)
                .rotation3DEffect(.degrees(70), axis: (x: 1, y: 0, z: 0))
                .offset(y: isMoving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.01), value: isMoving)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 110, height: 110)
                .rotation3DEffect(.degrees(70), axis: (x: 1, y: 0, z: 0))
                .offset(y: isMoving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.15), value: isMoving)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 140, height: 140)
                .rotation3DEffect(.degrees(70), axis: (x: 1, y: 0, z: 0))
                .offset(y: isMoving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.2), value: isMoving)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 170, height: 170)
                .rotation3DEffect(.degrees(70), axis: (x: 1, y: 0, z: 0))
                .offset(y: isMoving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.25), value: isMoving)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 200, height: 200)
                .rotation3DEffect(.degrees(70), axis: (x: 1, y: 0, z: 0))
                .offset(y: isMoving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.3), value: isMoving)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 230, height: 230)
                .rotation3DEffect(.degrees(70), axis: (x: 1, y: 0, z: 0))
                .offset(y: isMoving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.35), value: isMoving)
            
        }.onAppear{
            isMoving.toggle()
        }
    }
}

struct DisLoading_Previews: PreviewProvider {
    static var previews: some View {
        DisLoading()
    }
}
