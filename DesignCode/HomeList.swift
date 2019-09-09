//
//  HomeList.swift
//  DesignCode
//
//  Created by yl on 2019/9/6.
//  Copyright © 2019 yl. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @State var isPresent = false
    var course = courseData
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("21 Courses")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading,60)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:30) {
                        ForEach(course) { item in
                            GeometryReader{geometry in
                                CourseView(
                                    title: item.title,
                                    image: item.image,
                                    color: item.color,
                                    shadowColor: item.shadowColor, isPresent:self.$isPresent
                                )
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 40) / -20 ), axis: (x: 0.0, y: 10.0, z: 0.0))
                            }
                            .frame(width: 246, height: 150.0)
                        }
                    }
                    Spacer()
                }
                .sheet(isPresented: $isPresent, content: {ContentView()})
                .frame(height: 450)
                .padding(.leading, 40)
                .padding(.top, 30)
                
                Certificates()
                    .padding(.leading, 40)
                
            }
//            .padding(.top, 78.0)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow1")
    
    @Binding var isPresent: Bool
    
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(20)
                .padding(.leading)
                .lineLimit(4)
                .padding(.trailing,50)
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
                
                
        }
        .background(color)
        .cornerRadius(30)
        .frame(width:246, height:360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
        .onTapGesture {
            self.isPresent.toggle()
        }
    }
}

struct Course : Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let courseData = [
    Course(
        title: "Build an app With SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow1")
    ),
    Course(
        title: "Build an app With SwiftUI",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow2")
    ),
    Course(
        title: "Build an app With SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow1")
    ),
    Course(
        title: "Build an app With SwiftUI",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow2")
    ),
    Course(
        title: "Build an app With SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow1")
    ),
    Course(
        title: "Build an app With SwiftUI",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow2")
    ),
]
