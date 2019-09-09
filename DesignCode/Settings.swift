//
//  Settings.swift
//  DesignCode
//
//  Created by yl on 2019/9/9.
//  Copyright © 2019 yl. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var dateSelection = Date()
    @State var submit = false
    @State var email = ""
    
    var body: some View {
        
        NavigationView{
            Form{
                Toggle(isOn: $receive){
                    Text("Receive notifications")
                }
                Stepper(value:$number, in: 1...10){
                    Text("\(number) notification\(number > 1 ? "s" : "") per week")
                }
                
                Picker(selection: $selection, label: Text("Favorite course")){
                    Text("SwiftUI").tag(1)
                    Text("Python").tag(2)
                }
                
                DatePicker(selection: $dateSelection){
                    Text("Date")
                }

                
                Section(header: Text("Email")){
                    TextField("Enter your email", text: $email)
                }
                
                Button(action: {self.submit.toggle()}){
                    Text("Submit")
                }
                .alert(isPresented: $submit, content: {
                    Alert(title: Text("Thanks"), message: Text("Your Email is \(email)"))
                })
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
