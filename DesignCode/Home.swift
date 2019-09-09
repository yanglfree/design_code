//
//  Home.swift
//  DesignCode
//
//  Created by yl on 2019/9/5.
//  Copyright © 2019 yl. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var show = false
    @State var showProfile = false
    @State var showUpdate = false
    
    var body: some View {
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
                .scaleEffect(showProfile ? 0.95 : 1)
            
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())
            MenuRight(showProfile: $showProfile, showUpdate: $showUpdate)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())
            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct MenuRow: View {
    var image = ""
    var text = ""
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width:32.0, height:32.0)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign Out", icon: "arrow.uturn.down"),
]

struct MenuView: View {
    var menu = menuData
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(menu){ item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth:0, maxWidth:.infinity)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
        .animation(.easeInOut(duration: 0.5))
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {
                self.show.toggle()
            }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                    
                }
                .padding(.trailing, 20)
                .frame(width:90, height:60)
                .background(BlurView(style: .systemThinMaterial))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            Spacer()
        }
    }
}

struct CircleButton: View {
    var icon = ""
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color.primary)
        }
        .frame(width:44, height:44)
        .background(BlurView(style: .systemThinMaterial))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuRight: View {
    @Binding var showProfile: Bool
    @Binding var showUpdate: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Button(action: {
                    self.showProfile.toggle()
                }) {
                    CircleButton(icon: "person.circle")
                }
                
                Button(action: {
                    self.showUpdate.toggle()
                }) {
                    CircleButton(icon: "bell")
                }
            }
            Spacer()
        }
//
    }
}
