//
//  StickyHeader.swift
//  MagicalAnimation-SwiftUI
//
//  Created by Abdul Sami Sultan on 30/09/2023.
//

import SwiftUI

struct StickyHeader: View {
    
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    @State var show = false
    var body: some View {
        ZStack(alignment: .top, content: {
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    
                    GeometryReader { g in
                        Image("appstore_poster")
                            .resizable()
                            .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                            .frame(height: g.frame(in: .global).maxY > 0 ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY : UIScreen.main.bounds.height / 2.2)
                            .onReceive(self.time) { (_) in
                                let y = g.frame(in: .global).minY
                                if -y > (UIScreen.main.bounds.height / 2.2) - 50{
                                    withAnimation {
                                        self.show = true
                                    }
                                    
                                }else{
                                    withAnimation {
                                        self.show = false
                                    }
                                }
                            }
                    }.frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    VStack{
                        HStack{
                            Text("New Games We Love")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            Button {
                                
                            } label: {
                             Text("See All")
                                    .fontWeight(.bold)
                            }

                        }
                        VStack(spacing: 20){
                            ForEach(cardData){ item in
                                CardView(data: item)
                            }
                        }.padding(.top)
                    }.padding()
                    Spacer()
                }
               
            }
            if self.show{
                TopView()
            }
        })
        .edgesIgnoringSafeArea(.top)
    }
}
struct CardView: View {
    var data: Card
    var body: some View {
        HStack(alignment: .top,spacing: 20) {
            Image(self.data.image)
                .resizable()
                .frame(width: 80,height: 80)
            VStack(alignment: .leading,spacing: 6) {
                Text(self.data.title)
                    .fontWeight(.bold)
                Text(self.data.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack(spacing: 12) {
                    Button {
                        
                    } label: {
                        Text("GET")
                            .fontWeight(.bold)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                    }
                    Text("In-App/nPurchases")
                        .font(.caption)
                        .foregroundColor(.gray)

                }
            }
            Spacer(minLength: 0)
        }
    }
}

struct TopView: View {
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    Image("apple_icon")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 35,height: 35)
                        .foregroundColor(.primary)
                    Text("Arcade")
                        .font(.title)
                        .fontWeight(.bold)
                }
                Text("One Month free, then $4.99/month")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
            Button {
                
            } label: {
                Text("Try It Free")
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal,25)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
        }
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 15 : (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 5)
        .padding(.horizontal)
        .padding(.bottom)
        .background(BlurBG())
    }
}
struct BlurBG : UIViewRepresentable{
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        return view
    }
    
    
}
struct StickyHeader_Previews: PreviewProvider {
    static var previews: some View {
        StickyHeader()
    }
}

struct Card: Identifiable{
    var id: Int
    var image: String
    var title: String
    var subTitle:String
}
var cardData = [
    Card(id: 0, image: "game_icon_1", title: "Temple run", subTitle: "Interactive game Temple run"),
    Card(id: 1, image: "game_icon_2", title: "Mario Bros", subTitle: "Interactive game Mario Bros"),
    Card(id: 2, image: "game_icon_3", title: "Candy Saga", subTitle: "Interactive game Candy Saga"),
    Card(id: 3, image: "game_icon_4", title: "Candy Crush", subTitle: "Interactive game Candy Crush"),
    Card(id: 4, image: "game_icon_5", title: "Cut The Rope", subTitle: "Interactive game Cut The Rope"),
    Card(id: 5, image: "game_icon_6", title: "Jet Pack Fighter", subTitle: "Interactive game Jet Pack Fighter"),
    Card(id: 6, image: "game_icon_7", title: "Goblin Alien", subTitle: "Interactive game Goblin Alien"),
    Card(id: 7, image: "game_icon_8", title: "Drangon Saga", subTitle: "Interactive game Drangon Saga"),
    Card(id: 8, image: "game_icon_9", title: "Clans of Castle", subTitle: "Interactive game Clans of Castle")

]
