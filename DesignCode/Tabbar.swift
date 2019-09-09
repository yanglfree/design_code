//
//  Tabbar.swift
//  DesignCode
//
//  Created by yl on 2019/9/9.
//  Copyright © 2019 yl. All rights reserved.
//

import SwiftUI

struct Tabbar: View {
    
    @State var selection = 1
    
    var body: some View {
        TabView(selection: $selection){
            Home().tabItem({
                VStack {
                    Image(systemName: "house")
                    Text("home")
                }
                }).tag(1)
            
            ContentView().tabItem({
                VStack {
                    Image(systemName: "tag")
                    Text("Content")
                }
                }).tag(2)
            
            Settings().tabItem({
            VStack {
                Image(systemName: "paperplane")
                Text("Setting")
            }
            }).tag(3)
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            Tabbar()
            Tabbar()
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .large)
        }
    }
}
