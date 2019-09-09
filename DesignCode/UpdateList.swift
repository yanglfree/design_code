//
//  UpdateList.swift
//  DesignCode
//
//  Created by yl on 2019/9/9.
//  Copyright © 2019 yl. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    
    var updates  = updateData
    @ObservedObject var updateStore = UpdateStore(updates: updateData)
    
    
    func addUpdate(){
        updateStore.updates.append(Update(title: "New title", image: "Certificate1", text: "New text", date: "Jun 1"))
    }
    
    func move(from source: IndexSet, to destination: Int){
        updateStore.updates.swapAt(source.first!, destination)
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
               
                
                List{
                    ForEach(updateStore.updates) { item in
                        NavigationLink(destination: UpdateDetail(title: item.title, image: item.image, text: item.text)) {
                            HStack(spacing: 12.0) {
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .background(Color("background"))
                                    .cornerRadius(20)
                                
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(item.title)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                    Text(item.text)
                                        .font(.subheadline)
                                        .lineSpacing(5)
                                        .lineLimit(2)
                                        .frame(height:50)
                                    
                                    Text(item.date)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                    }
                    .onDelete{ index in
                        self.updateStore.updates.remove(at: index.first!)
                    }
                    .onMove(perform: move)
                    
                }
                .navigationBarTitle("Update")
                .navigationBarItems(leading:  Button(action: {
                    self.addUpdate()
                }) {
                    Image(systemName: "plus")
                }, trailing:  EditButton())
            }
            
        }
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var text: String
    var date: String
}

let updateData = [
    Update(title: "SwiftUI", image: "Illustration1", text: "Learn how to build custom views and controllers in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper  understanding of the layout system of SwiftUI", date: "JUN 26"),
    Update(title: "Java", image: "Illustration2", text: "Learn how to build custom views and controllers in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper  understanding of the layout system of SwiftUI", date: "JUN 29"),
    Update(title: "Objective-C", image: "Illustration3", text: "Learn how to build custom views and controllers in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper  understanding of the layout system of SwiftUI", date: "May 26"),
    Update(title: "Vue", image: "Illustration4", text: "Learn how to build custom views and controllers in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper  understanding of the layout system of SwiftUI", date: "JUN 1"),
    Update(title: "Python", image: "Illustration5", text: "Learn how to build custom views and controllers in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper  understanding of the layout system of SwiftUI", date: "SEP 10"),
    Update(title: "Vue", image: "Illustration4", text: "Learn how to build custom views and controllers in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper  understanding of the layout system of SwiftUI", date: "JUN 1"),
]
